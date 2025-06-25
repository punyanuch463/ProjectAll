const express = require('express');
const path = require('path')
const port=3005
const app = express();
/* 1. Create a router object and register the router */
const router = express.Router();
app.use(router)
/* Import and use Environmental Variable */
router.use(express.json());
router.use(express.urlencoded({ extended: true }));

app.use('/', express.static(path.join(__dirname,'image')));
app.use('/', express.static(path.join(__dirname,'css')));
app.use('/', express.static(path.join(__dirname,'product')));
app.use('/', express.static(path.join(__dirname,'assets')));


router.get('/homepage', (req, res) => {
    res.sendFile(path.join(`${__dirname}/homepage.html`))
})
router.get('/login', (req, res) => {
    res.sendFile(path.join(`${__dirname}/login.html`))
})
router.get('/search', (req, res) => {
    res.sendFile(path.join(`${__dirname}/search.html`))
})
router.get('/product', (req, res) => {
    res.sendFile(path.join(`${__dirname}/product&service.html`))
})
router.get('/aboutus', (req, res) => {
    res.sendFile(path.join(`${__dirname}/aboutus.html`))
})
router.get('/test', (req, res) => {
    res.sendFile(path.join(`${__dirname}/test.html`))
})

app.listen(port, () => {
    console.log(`Server listening on port: ${port}`)
    })
    