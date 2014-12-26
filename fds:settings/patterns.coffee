'use strict'

share.Patterns =
  NonNegativeInteger: Match.Where (x) ->
    check x, Match.Integer
    x >= 0

  NonNegativeNumber: Match.Where (x) ->
    check x, Number
    x >= 0

  PositiveNumber: Match.Where (x) ->
    check x, Number
    x > 0

  PositiveInteger: Match.Where (x) ->
    check x, Match.Integer
    x > 0

