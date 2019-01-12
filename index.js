// Load environment
require('dotenv').config();

const bodyParser = require('body-parser')
const express = require('express');
const app = express();
app.use(bodyParser.json());
const port = 3001;

const { 
  getSlotTypes,
  getSlotType,
  createSlotType
} = require ('./app/db');

app.get('/slot_types', async (req, res) => {
  const slotTypes = await getSlotTypes();
  res.json(slotTypes);
});

app.get('/slot_types/:id', async (req, res) => {
  const slotType = await getSlotType(req.params.id);
  res.json(slotType);
});

app.post('/slot_types', async (req, res) => {
  res.json(await createSlotType(req.body));
});

app.listen(port, () => console.log(`Example app listening on port ${port}!`));

