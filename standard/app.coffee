express = require('express')
routes = require('./routes')
http = require('http')
path = require('path')

app = express()

# config
app.config = try require("./config/#{app.settings.env}") catch then {}

app.set('port', process.env.PORT or 3000)
app.set('views', path.join(__dirname, 'views'))
app.set('view engine', 'ejs')

# middleware
app.use(express.logger('dev'))
app.use(express.json())
app.use(express.urlencoded())
app.use(express.methodOverride())
app.use(express.cookieParser())
app.use(express.bodyParser())
app.use(express.session(secret: 'bankshot25'))
app.use(app.router)
app.use(express.static(path.join(__dirname, 'public')))

# development only
env = process.env.NODE_ENV or 'development'
if env is 'development'
  app.use(express.errorHandler())

# routes
app.get('/', routes.index)
app.get('/extras', routes.extras)

http.createServer(app).listen app.get('port'), ->
  console.log("Express server listening on port #{app.get('port')}")
