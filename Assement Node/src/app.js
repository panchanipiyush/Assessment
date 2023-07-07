const express = require("express")
const app = express()
const momgoose = require("mongoose")
const hbs = require("hbs")
const path = require ("path")
var cookieParser = require('cookie-parser')
var bodyParser = require('body-parser')
require("dotenv").config()
const PORT = process.env.PORT
const DB_URL=process.env.DB_URL
app.use(cookieParser())
momgoose.connect(DB_URL).then(result =>{
      console.log("DB Connected");
}).catch(err=>{
    console.log(err);
})
app.use(express.json())
app.use(bodyParser.urlencoded({ extended: false }))

const viewPath = path.join(__dirname,"../templetes/views")
const partialPath = path.join(__dirname,"../templetes/partails")
const publicPath = path.join(__dirname,"../public")

app.set("view engine","hbs")
app.set("views",viewPath)
hbs.registerPartials(partialPath)
app.use(express.static(publicPath))


app.use("/",require("../router/userrouter"))

app.listen(PORT,()=>{
    console.log("Server running on port : "+PORT);
}) 