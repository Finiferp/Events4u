const express = require('express');
const app = express();
const cors = require('cors');
const port = 3000;
const bodyParser = require('body-parser');


app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

require('./routes/eventRoutes')(app);

app.use((req, res) => {
    res.status(404).send('Please enter a valid endpoint.');
});

app.listen(port);
console.log("Server started");