const express = require('express');
const app = express();
const cors = require('cors');
const port = 3000;
const bodyParser = require('body-parser');
const cron = require('node-cron');


app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use('/assets', express.static('assets'));

require('./routes/eventRoutes')(app);
require('./routes/locationRoutes')(app);
require('./routes/userRoutes')(app);
require('./routes/auditRoutes')(app);

app.use((req, res) => {
    res.status(404).send('Please enter a valid endpoint.');
});

cron.schedule('* 1 * * *', () => {
    console.log('running a task every minute');
}, {
    scheduled: true,
    timezone: 'Europe/Berlin'
});

app.listen(port);
console.log("Server started");