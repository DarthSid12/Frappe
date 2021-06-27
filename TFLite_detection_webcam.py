# Import packages
import os
import argparse
import cv2
import numpy as np
import time
import importlib.util
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import RPi.GPIO as GPIO

add_button = 14
delete_button = 22

GPIO.setmode(GPIO.BCM)
GPIO.setup(add_button, GPIO.IN)
GPIO.setup(delete_button, GPIO.IN)

GPIO.setwarnings(False)
ledPin = 12
GPIO.setup(ledPin, GPIO.OUT)
ledPin1 = 16
GPIO.setup(ledPin1, GPIO.OUT)

fridge_id = '2PJvDrpYIUZfQ3DLufj5'

cred = credentials.Certificate("serviceAccountKey.json")
firebase_admin.initialize_app(cred)

firestore_db = firestore.client()

foodObjects = ["apple", "banana", "sandwich", "orange", "broccoli", "carrot", "donut", "cake", "pizza", "hot dog"]

# Define and parse input arguments
parser = argparse.ArgumentParser()
parser.add_argument('--modeldir', help='Folder the .tflite file is located in',
                    required=True)
parser.add_argument('--graph', help='Name of the .tflite file, if different than detect.tflite',
                    default='detect.tflite')
parser.add_argument('--labels', help='Name of the labelmap file, if different than labelmap.txt',
                    default='labelmap.txt')
parser.add_argument('--threshold', help='Minimum confidence threshold for displaying detected objects',
                    default=0.5)
parser.add_argument('--resolution',
                    help='Desired webcam resolution in WxH. If the webcam does not support the resolution entered, errors may occur.',
                    default='1280x720')
parser.add_argument('--edgetpu', help='Use Coral Edge TPU Accelerator to speed up detection',
                    action='store_true')

args = parser.parse_args()

MODEL_NAME = args.modeldir
GRAPH_NAME = args.graph
LABELMAP_NAME = args.labels
min_conf_threshold = float(args.threshold)
resW, resH = args.resolution.split('x')
imW, imH = int(resW), int(resH)
use_TPU = args.edgetpu

# Import TensorFlow libraries
# If tflite_runtime is installed, import interpreter from tflite_runtime, else import from regular tensorflow
# If using Coral Edge TPU, import the load_delegate library
pkg = importlib.util.find_spec('tflite_runtime')
if pkg:
    from tflite_runtime.interpreter import Interpreter

    if use_TPU:
        from tflite_runtime.interpreter import load_delegate
else:
    from tensorflow.lite.python.interpreter import Interpreter

    if use_TPU:
        from tensorflow.lite.python.interpreter import load_delegate

# If using Edge TPU, assign filename for Edge TPU model
if use_TPU:
    if (GRAPH_NAME == 'detect.tflite'):
        GRAPH_NAME = 'edgetpu.tflite'

    # Get path to current working directory
CWD_PATH = os.getcwd()

# Path to .tflite file, which contains the model that is used for object detection
PATH_TO_CKPT = os.path.join(CWD_PATH, MODEL_NAME, GRAPH_NAME)

# Path to label map file
PATH_TO_LABELS = os.path.join(CWD_PATH, MODEL_NAME, LABELMAP_NAME)

# Load the label map
with open(PATH_TO_LABELS, 'r') as f:
    labels = [line.strip() for line in f.readlines()]

# Have to do a weird fix for label map when using the COCO "starter model" from
# https://www.tensorflow.org/lite/models/object_detection/overview
# First label is '???', which has to be removed.
if labels[0] == '???':
    del (labels[0])

# Load the Tensorflow Lite model.
# If using Edge TPU, use special load_delegate argument
if use_TPU:
    interpreter = Interpreter(model_path=PATH_TO_CKPT,
                              experimental_delegates=[load_delegate('libedgetpu.so.1.0')])
    print(PATH_TO_CKPT)
else:
    interpreter = Interpreter(model_path=PATH_TO_CKPT)

interpreter.allocate_tensors()

# Get model details
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()
height = input_details[0]['shape'][1]
width = input_details[0]['shape'][2]

floating_model = (input_details[0]['dtype'] == np.float32)

input_mean = 127.5
input_std = 127.5

time.sleep(1)

# Create window
cv2.namedWindow('Object detector', cv2.WINDOW_NORMAL)


# for frame1 in camera.capture_continuous(rawCapture, format="bgr",use_video_port=True):
# Start timer (for calculating frame rate)
def processImage():
    camera = cv2.VideoCapture(0)
    return_value, frame1 = camera.read()

    # Acquire frame and resize to expected shape [1xHxWx3]
    frame = frame1.copy()
    frame_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
    frame_resized = cv2.resize(frame_rgb, (width, height))
    input_data = np.expand_dims(frame_resized, axis=0)

    # Normalize pixel values if using a floating model (i.e. if model is non-quantized)
    if floating_model:
        input_data = (np.float32(input_data) - input_mean) / input_std

    # Perform the actual detection by running the model with the image as input
    interpreter.set_tensor(input_details[0]['index'], input_data)
    interpreter.invoke()

    # Retrieve detection results
    # boxes = interpreter.get_tensor(output_details[0]['index'])[0]  # Bounding box coordinates of detected objects
    classes = interpreter.get_tensor(output_details[1]['index'])[0]  # Class index of detected objects
    scores = interpreter.get_tensor(output_details[2]['index'])[0]  # Confidence of detected objects
    # num = interpreter.get_tensor(output_details[3]['index'])[0]  # Total number of detected objects (inaccurate and not needed)

    # Loop over all detections and add to recognizedObjects if confidence is above minimum threshold
    recognizedObjects = []
    for i in range(len(scores)):
        if (scores[i] > min_conf_threshold) and (scores[i] <= 1.0):
            # Get bounding box coordinates and draw box
            # Interpreter can return coordinates that are outside of image dimensions, need to force them to be within image using max() and min()

            # Draw label
            object_name = labels[int(classes[i])]  # Look up object name from "labels" array using class index

            # Print info
            print('Object ' + str(i) + ': ' + object_name )
            recognizedObjects.append({'object': object_name, 'accuracy': scores[i]})

    print(recognizedObjects)


    # All the results have been drawn on the frame, so it's time to display it.
    cv2.imshow('Object detector', frame)

    return recognizedObjects


def add_item():
    recognizedObjects = processImage()
    print('Step 1')
    for ob in recognizedObjects:
        if ob['object'] in foodObjects:
            itemReference = firestore_db.collection('Fridges').document(fridge_id).collection('items')
            itemReference.add({
                'name': ob['object'],
                'timestamp': time.time() * 1000
                # 'exp. date': 1624953224000
            })


def delete_item():
    recognizedObjects = processImage()
    for ob in recognizedObjects:
        if ob['object'] in foodObjects:
            itemReference = firestore_db.collection('Fridges').document(fridge_id).collection('items').where(u'name',
                                                                                                             u'==', ob[
                                                                                                                 'object']).get()
            if len(itemReference) > 0:
                itemReference[0].reference.delete()


previousAddSwitch = 0
previousOffSwitch = 0
#
# while True:
#   if (GPIO.input(add_button) != previousAddSwitch ):
#     time.sleep(2)
#     add_item()
#     previousAddSwitch = not previousAddSwitch
#     print("Add Button Pressed")
#   elif (GPIO.input(delete_button) != previousOffSwitch):
#     time.sleep(2)
#     delete_item()
#     previousOffSwitch = not previousOffSwitch
#     print("Delete Button Pressed")

while True:
    if not GPIO.input(add_button):
        time.sleep(0.25)
        add_item()
        previousAddSwitch = not previousAddSwitch
        print("Add Button Pressed")
        print("LED del turning on.")
        GPIO.output(ledPin, GPIO.HIGH)
        time.sleep(1)
        print("LED turning off.")
        GPIO.output(ledPin, GPIO.LOW) 
        time.sleep(0.25)
    elif not GPIO.input(delete_button):
        time.sleep(0.25)
        delete_item()
        previousOffSwitch = not previousOffSwitch
        print("Delete Button Pressed")
        print("LED ADD turning on.")
        GPIO.output(ledPin1, GPIO.HIGH)
        time.sleep(1)
        print("LED turning off.")
        GPIO.output(ledPin1, GPIO.LOW) 
        time.sleep(0.25)