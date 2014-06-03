module.exports = (grunt) ->
  grunt.initConfig

    copy:
      fonts:
        expand: true
        flatten: true
        src: 'src/fonts/*'
        dest: 'dist/fonts/'
      images:
        expand: true
        flatten: true
        src: 'src/images/*'
        dest: 'dist/images/'

    watch:
      sass:
        files: 'src/styles/**/*.scss'
        tasks: 'sass'

      html:
        files: 'src/**/*.{hbs,md}'
        tasks: 'assemble'

    bowercopy:
      options:
        srcPrefix: 'bower_components'
      bootstrapDev:
          src: 'bootstrap-sass-official/vendor/assets'
          dest: 'src/vendor/bootstrap'
      bootstrapDist:
        src: 'bootstrap-sass-official/vendor/assets/javascripts/bootstrap'
        dest:'dist/vendor/bootstrap'
      modernizr:
          src: 'bower_components/modernizr/modernizr.js'
          dest: 'dist/vendor/modernizr.js'

    sass:
      dist:
        src: 'src/styles/main.scss'
        dest: 'dist/styles/main.css'

    assemble:
      options:
        plugins: ['assemble-markdown-data']
        partials: 'src/templates/partials/*.hbs'
        layout: 'default.hbs'
        layoutdir: 'src/templates/layouts'
      site:
        expand: true
        flatten: true
        src: 'src/pages/**/*.{hbs,md}'
        dest: 'dist/'
  
  grunt.registerTask 'default', ['bowercopy', 'copy', 'sass', 'assemble']

  grunt.loadNpmTasks 'grunt-sass'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'assemble'
  grunt.loadNpmTasks 'grunt-bowercopy'
