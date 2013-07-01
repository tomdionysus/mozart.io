path = require "path"

module.exports = (grunt) ->
  grunt.registerTask 'integration', 'Starts the server stub', ->
    express = require "express"
    fs = require "fs"
    app = express()

    port = grunt.config('integration.port') || 8010;
    base = path.resolve(grunt.config('integration.base') || '.');

    GLOBAL.app = app

    app.configure ->
      app.use express.logger(format: "dev")
      app.use express.compress()
      app.use express.bodyParser()
      app.use express.cookieParser()
      app.use express.methodOverride()
      app.use express.static(base)
      app.use app.router
      app.use (req, res) ->
        res.sendfile("public/index.html")

    app.configure "development", ->
    app.use express.errorHandler(
      dumpExceptions: true
      showStack: true
    )

    app.configure "production", ->
      app.use express.errorHandler()

    app.listen port
    console.log "Mozart Express server listening on port #{port}"