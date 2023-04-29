'use strict';
const express = require('express');
const config = require('./config');
const cors = require('cors');
const bodyParser = require('body-parser');
const QLKSRoutes = require('./routes/QLKSRoutes');

const app = express();

app.use(cors());
app.use(bodyParser.json());

app.use('/api', QLKSRoutes.routes);

app.listen(config.port, () => {
  console.log('app listening on url http://localhost:' + config.port )
});