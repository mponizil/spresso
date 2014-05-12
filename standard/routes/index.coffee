exports.index = (req, res) ->
  res.render('index', title: "Standard")

exports.extras = (req, res) ->
  res.render('index', title: "Extras")
