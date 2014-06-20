module.exports = (grunt) ->
  grunt.initConfig

    copy:
      fonts:
        expand: true
        flatten: true
        src: 'src/fonts/*'
        dest: 'dist/fonts/'
      bootstrapFonts:
        expand: true
        flatten: true
        src: 'src/vendor/bootstrap/fonts/bootstrap/*'
        dest: 'dist/styles/bootstrap/'

    watch:
      sass:
        files: 'src/styles/**/*.scss'
        tasks: 'css'

      html:
        files: 'src/**/*.{hbs,md}'
        tasks: 'assemble'

      images:
        files: 'src/images/**/*'
        tasks: 'imagemin'

    imagemin:
      dynamic:
        files: [
          expand: true
          cwd: 'src/images/'
          src: ['**/*.{png,jpg,gif}']
          dest: 'dist/images/'
        ]

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
      hyphenator:
        src: 'bower_components/hyphenator/Hyphenator.js'
        dest: 'dist/vendor/hyphenator.js'
      fittext:
        src: 'bower_components/fittext/jquery.fittext.js'
        dest: 'dist/vendor/fittext.js'

    sass:
      dist:
        src: 'src/styles/main.scss'
        dest: 'src/styles/main.css'

     autoprefixer:
        dist:
          src: 'src/styles/main.css'
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
  
  grunt.registerTask 'css', ['sass', 'autoprefixer']

  grunt.registerTask 'default', ['bowercopy', 'copy', 'imagemin', 'css', 'assemble']

  grunt.loadNpmTasks 'grunt-sass'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-imagemin'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-autoprefixer'
  grunt.loadNpmTasks 'assemble'
  grunt.loadNpmTasks 'grunt-bowercopy'
