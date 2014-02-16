_ = require 'underscore'
{methods, eachMethods} = require './methods'

_(eachMethods).each (method) ->
  exports[method + 'Each'] = (args...) ->
    _(@value).map (e) -> _(e)[method](args...)

_(methods).each (method) ->
  exports[method] = (args...) ->
    _(@value)[method](args...)
