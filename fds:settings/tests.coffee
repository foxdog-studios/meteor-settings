Tinytest.add 'Parse complete settings', (test) ->
  input =
    public:
      name: 'Scott'
      age: 24

  settings = Settings input, ->
    public:
      name: @Value String, 'Jamie'
      age: @Value @NonNegativeInteger, 25

  test.equal settings, input


Tinytest.add 'Parse incomplete settings', (test) ->
  input =
    public:
      name: 'Scott'

  settings = Settings input, ->
    public:
      name: @Value String, 'Jamie'
      age: @Value @NonNegativeInteger, 25

  test.equal settings,
    public:
      name: 'Scott'
      age: 25


Tinytest.add 'Parsing invalid settings', (test) ->
  input =
    public:
      name: 'Scott'
      age: 25
      unknown: 'property'

  makeSettings = ->
    Settings input, ->
      public:
        name: @Value String, 'Jamie'
        age: @Value @NonNegativeInteger, 25

  test.throws makeSettings, Match.Error

