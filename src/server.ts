import { Logger } from 'tslog'
import express from 'express'

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// Logger
const logger = new Logger({ name: 'Nodockernetes'})

// App
const app = express();
app.get('/', (req, res) => {
  logger.info(`GET /`)
  res.send('Hello World');
});

app.listen(PORT, HOST);
logger.info(`Running on http://${HOST}:${PORT}`);