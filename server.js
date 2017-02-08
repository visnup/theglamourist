const express = require('express')
const path = require('path')

const port = process.env.PORT || 3001
let app = express()

app.use(express.static(__dirname + '/public'))

app.get('/posts', (req, res) => {
  res.send([
    { id: 1, title: 'test' }
  ])
})

app.get('^', (req, res) => {
  res.sendFile(path.resolve(__dirname, 'public', 'index.html'))
})

app.listen(port, () => {
  console.log(`Listening on ${port}`)
})
