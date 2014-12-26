# fds:settings

Enhanced settings for Meteor.


## Install

```ShellSession
$ meteor add fds:settings
```


## Example

```CoffeeScript
@Settings = Settings ->
  public:
    author:
      name:
        first: @Value String, 'Scott'
        last: @Value String, 'Jamie'
      age: @Value @NonNegativeInteger, 25
```


### Realistic

__server/settings.coffee__

```CoffeeScript
share.PrivateSettings = Settings (Meteor.settings ? {}) ->
  public: share.makePublicSettingsSchema.call this
  secret: @Value String
```


__lib/settings.coffee__

```CoffeeScript
share.makePublicSettingsSchema = ->
  author:
    name:
      first: @Value String, 'Scott'
      last: @Value String, 'Jamie'
    age: @Value @NonNegativeInteger, 25


share.PublicSettings = Settings(Meteor.settings?.public ? {},
                                share.makePublicSettingsSchema)
```

