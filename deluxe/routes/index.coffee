exports.index = (req, res) ->
  res.render('index', title: "Collect it")

exports.signup = (req, res) ->
  res.render('signup')

exports.register = (req, res) ->
  username = email = req.body.email
  password = req.body.password
  req.app.kaiseki.createUser {username, email, password}, (error, response, user, success) ->
    req.login user, (error) ->
      res.redirect('/items')

exports.login = (req, res) ->
  res.render('login')

exports.logout = (req, res) ->
  req.logout()
  res.redirect('/')

exports.items = require('./items')
