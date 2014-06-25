module.exports = (grunt) ->
  require('load-grunt-config')(grunt)
  require('load-grunt-tasks')(grunt)

  grunt.loadNpmTasks 'assemble'
