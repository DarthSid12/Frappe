import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

fridge_id = '2PJvDrpYIUZfQ3DLufj5'

cred = credentials.Certificate("serviceAccountKey.json")
firebase_admin.initialize_app(cred)

firestore_db = firestore.client()

itemReference = firestore_db.collection('Fridges').document(fridge_id).collection('items')
itemReference.add({
    'name': 'apple',
    # 'exp. date': 1624953224000
})
