var connect = require('connect');
var port = process.env.PORT || 3000;
var oneDay = 86400000;

connect.createServer(
  connect.compress(),
  connect.logger('short'),
  connect.favicon(__dirname + '/build/assets'),
  connect.static(__dirname + '/build', { maxAge: oneDay })
).listen(port);
