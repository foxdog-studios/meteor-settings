'use strict'

class share.Value
  constructor: (@pattern, @default) ->
    @hasDefault = arguments.length == 2

