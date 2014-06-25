module.exports =
  options:
    livereload: true
  sass:
    files: 'src/styles/**/*.scss'
    tasks: 'css'
  scripts:
    files: 'src/scripts/**/*.js'
    tasks: 'concat'
  html:
    files: 'src/**/*.{hbs,md}'
    tasks: 'assemble'
  images:
    files: 'src/images/**/*'
    tasks: 'imagemin'
