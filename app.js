var createError = require('http-errors');
var express = require('express');
const cors = require('cors');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

const sequelize = require('./app/services/db');

var app = express();
app.use(cors());
app.use(express.static(path.join(__dirname, 'public')));

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

// ROUTES
app.use('/games', require('./app/routes/games.route'));
app.use('/companies', require('./app/routes/companies.route'));
app.use('/platforms', require('./app/routes/platforms.route'));
app.use('/models', require('./app/routes/models.route'));
app.use('/people', require('./app/routes/people.route'));
app.use('/franchises', require('./app/routes/franchises.route'));
app.use('/series', require('./app/routes/series.route'));
app.use('/characters', require('./app/routes/characters.route'));
app.use('/genres', require('./app/routes/genres.route'));
app.use('/themes', require('./app/routes/themes.route'));
app.use('/awards', require('./app/routes/awards.route'));

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

app.listen(3000, () => {
  console.log('Server is running on port 3000');

  sequelize.sync({alter: true}).then(function () {
    console.log("Database Configured");
  });
});

module.exports = app;




