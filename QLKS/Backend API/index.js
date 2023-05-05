'use strict';
const express = require('express');
const config = require('./config');
const cors = require('cors');
const bodyParser = require('body-parser');
<<<<<<< Updated upstream
=======
<<<<<<< HEAD

=======
>>>>>>> b22ff4b1410b776fbedb8a05d99d45c43a44ae1d
>>>>>>> Stashed changes
const QLKSRoutes = require('./routes/QLKSRoutes');

const app = express();

app.use(cors());
app.use(bodyParser.json());

app.use('/api', QLKSRoutes.routes);

app.listen(config.port, () => {
  console.log('app listening on url http://localhost:' + config.port )
});