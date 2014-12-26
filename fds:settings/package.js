'use strict'

Package.describe({
  name: 'fds:settings',
  summary: 'Enhanced settings',
  version: '0.0.0',
  git: 'https://github.com/foxdog-studios/meteor-settings.git'
});

Package.onUse(function(api) {
  api.versionsFrom('1.0.2.1');
  api.use('check');
  api.use('coffeescript');
  api.addFiles([
    'globals.js',
    'patterns.coffee',
    'settings.coffee',
    'value.coffee'
  ]);
});

Package.onTest(function(api) {
  api.use('coffeescript');
  api.use('tinytest');
  api.use('fds:settings');
  api.addFiles('tests.coffee');
});

