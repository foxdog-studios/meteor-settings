'use strict'

@Settings = ->
  if arguments.length == 1
    settings = Meteor.settings
    makeSchema = arguments[0]
  else
    [settings, makeSchema] = arguments

  schema = makeSchema.call _.extend {}, share.Patterns,
    Value: ->
      new share.Value arguments...

  settings = complete schema, _.clone settings
  check settings, makePattern schema
  settings


complete = (schema, settings) ->
  for name, subschema of schema
    isNotValue = not isValueInstance subschema
    unless name of settings
      set = (value) -> settings[name] = value
      if isNotValue
        set {}
      else if subschema.hasDefault
        set subschema.default
    if isNotValue
      complete subschema, settings[name]
  settings


makePattern = (schema) ->
  pattern = {}
  for name, subschema of schema
    pattern[name] = if isValueInstance subschema
      subschema.pattern
    else
      makePattern subschema
  pattern


isValueInstance = (x) ->
  x instanceof share.Value

