const router = require("express").Router()
const User = require("../model/users")
const bcrypt = require("bcryptjs")
const auth = require("../middelware/auth")




router.get("/", (req, res) => {
    res.render("login")
})

router.get("/reg", (req, res) => {
    res.render("reg")
})

router.post("/do_register", async (req, res) => {
    try {
        const user = new User({

            uname: req.body.uname,
            email: req.body.email,
            pass: req.body.pass
        })
        await user.save()
        res.render("reg", { msg: "Registration successfully done !!!" })
    } catch (error) {
        console.log(error);
    }
})

router.get("/viewuser", auth, async (req, res) => {
    try {
        const data = await User.find();
        res.render("view", { userdata: data })
    } catch (error) {
        console.log(error);
    }
})

router.get("/deletuser", async (req, res) => {
    try {
        const id = req.query.uid
        await User.findByIdAndDelete(id)
        res.redirect("viewuser")
    } catch (error) {
        console.log(error);
    }
})

router.get("/edituser", async (req, res) => {
    try {
        const id = req.query.uid
        const data = await User.findOne({ _id: id })
        res.render("update", { data: data })
    } catch (error) {
        console.log(error);
    }
})


router.post("/do_update", async (req, res) => {
    try {
        const id = req.body.id
        const data = await User.findByIdAndUpdate(id, req.body)
        console.log(data);
        res.redirect("viewuser")
    } catch (error) {
        console.log(error);
    }
})

router.post("/do_login", async (req, res) => {
    try {
        const user = await User.findOne({ email: req.body.email })

        const isValid = await bcrypt.compare(req.body.pass, user.pass)

        if (isValid) {
            const token = await user.generateToken()
            // console.log(token);
            res.cookie("jwt", token)
            res.redirect("viewuser")
        }
        else {
            res.render("login", { err: "Invalid credenatials !!!" })
        }
    } catch (error) {
        res.render("login", { err: "Invalid credenatials !!!" })
    }
})

router.get("/logout", auth, async (req, res) => {
    try {
        const user = req.user
        const token = req.token

        user.Tokens.filter(ele=>{
            return ele.token!=token
        })
        
        user.save()
        res.clearCookie("jwt")
        res.render("login")
    } catch (error) {

    }
})

router.get("/logoutall", auth, async (req, res) => {
    try {
        const user = req.user
        const token = req.token

        user.Tokens = []
        user.save()
        res.clearCookie("jwt")
        res.render("login")
    } catch (error) {

    }
})



module.exports = router