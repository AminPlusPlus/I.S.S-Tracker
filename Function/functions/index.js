const functions = require("firebase-functions");
const axios = require('axios');
const admin = require('firebase-admin');

admin.initializeApp();

const db = admin.firestore();

exports.fetchDataAndWriteToFirestore = functions.pubsub
  .schedule('every 24 hours')
  .timeZone('UTC')
  .onRun(async () => {
    try {
      const response = await axios.get(
        'http://api.open-notify.org/astros.json'
      );
      const data = response.data;

      const issCrew = data.people.filter((person) => person.craft === 'ISS');

      const promises = issCrew.map(async (person) => {
        // Write each crew member to Firestore
        await db.collection('Crews').doc().set({
          fullname: person.name,
          country: '',
          description: '',
          image: ''
        });
        console.log(`Document for ${person.name} written to Firestore.`);
      });

      await Promise.all(promises);

      console.log('All crew members written to Firestore successfully.');
      return null;
    } catch (error) {
      console.error('Error:', error);
      return null;
    }
  });

  exports.fetchDataAndWriteToFirestoreHTTP = functions.https.onRequest(async (req, res) => {
    try {
      const response = await axios.get('http://api.open-notify.org/astros.json');
      const data = response.data;
  
      const issCrew = data.people.filter((person) => person.craft === 'ISS');
  
      const promises = issCrew.map(async (person) => {
        // Write each crew member to Firestore
        await db.collection('Crews').doc().set({
          fullname: person.name,
          country: '',
          description: '',
          image: ''
        });
        console.log(`Document for ${person.name} written to Firestore.`);
      });
  
      await Promise.all(promises);
  
      console.log('All crew members written to Firestore successfully.');
      
      res.status(200).send('Data fetched and written to Firestore successfully.');
    } catch (error) {
      console.error('Error:', error);
      res.status(500).send('An error occurred while fetching data and writing to Firestore.');
    }
  });
  