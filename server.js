const express = require('express');

const app = express();

const port = process.env.PORT || 3003

const router = express.Router();

app.use(express.static(`${__dirname}/dist`)) // set the static files locations for static html

app.engine('.html', require('ejs').renderFile)

app.set('views', `${__dirname}/dist`)

// always serves index html because vue handle routing
router.get('/*', (req, res, next) => {
  res.sendFile(`${__dirname}/dist/index.html`)
})

app.listen(port);

console.log('App running on port', port);