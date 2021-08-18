const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
const routes = require('./routes');

dotenv.config({path:'config.env'});

const server = express();

server.use(cors());

server.use('/api', routes);

server.listen(process.env.PORT, ()=>{
    console.log(`Server is runing in: http://localhost:${process.env.PORT}.`);
});