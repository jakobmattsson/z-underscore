var chai = require('chai');
var jscov = require('jscov');
var chaiAsPromised = require('chai-as-promised');
var mochaAsPromised = require('mocha-as-promised');

chai.should();
chai.use(chaiAsPromised);
mochaAsPromised();

var global = (function() { return this; }());

global.requireSource = function(name) {
  return require(jscov.cover('../..', 'lib', name));
};
