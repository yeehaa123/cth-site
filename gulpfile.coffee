gulp       = require('gulp')
shell      = require('gulp-shell')
rename     = require('gulp-rename')
coffee     = require('gulp-coffee')
concat     = require('gulp-concat')
uglify     = require('gulp-uglify')
assemble   = require('gulp-assemble')
bower      = require('gulp-bower')
sass       = require('gulp-sass')
protractor = require('gulp-protractor').protractor

paths =
  buildScripts: './scripts/app.js'
  css: [
    'src/vendor/bootstrap-sass-official/vendor/assets/stylesheets/**/*.scss',
    'src/css/**/*.scss'
  ]
  assets: [
    'src/**/*.svg',
    'src/**/*.eot',
    'src/**/*.woff'
  ]
 
options =
  data: 'data/*.json',
  partials: 'src/templates/partials/**/*.hbs'
  layoutdir: 'templates/layouts/'

gulp.task 'assets', ->
  gulp.src paths.assets
      .pipe gulp.dest('dist')

gulp.task 'vendor', ->
  bower()
    .pipe(gulp.dest('src/vendor'))
    .pipe(gulp.dest('dist/vendor'))

gulp.task 'assemble', ->
    gulp.src('src/templates/pages/*.hbs')
        .pipe(assemble(options))
        .pipe(gulp.dest('dist/'))

gulp.task 'css', ['vendor'], ->
   gulp.src paths.css
       .pipe(sass({ style: 'expanded' }))
       .pipe(gulp.dest('dist/css'))

# Javascript Tasks
gulp.task 'build-html', ->
  gulp.src('./src/**/*.html')
      .pipe(gulp.dest('./dist/'))

gulp.task 'build-scripts', ->
   gulp.src ['./src/scripts/app.coffee', './src/scripts/app2.coffee']
    .pipe coffee({bare: true})
    .pipe concat('app.js')
    .pipe gulp.dest('./dist/scripts')
    .pipe rename('app.min.js')
    .pipe uglify()
    .pipe gulp.dest('./dist/scripts')

gulp.task 'test-coffee2js', ->
  gulp.src('./spec/**/*.coffee')
      .pipe(coffee({bare: true}))
      .pipe(gulp.dest('./spec/'))

gulp.task 'e2e-test', ->
  gulp.src ["./e2e/*.js"]
      .pipe protractor
        configFile: "./e2e/spec-e2e.coffee"
        args: ['--baseUrl', 'http://127.0.0.1:8000']
      .on 'error', (e) -> throw e

gulp.task 'unit-tests', shell.task('testem ci')

gulp.task 'ci', ['test-coffee2js', 'unit-tests']

# General Tasks

gulp.task 'watch', ->
  gulp.watch './spec/**/*.coffee', ['test-coffee2js']
  gulp.watch './src/**/*.coffee', ['build-scripts']
  gulp.watch './src/**/*.html', ['build-html']
  gulp.watch './src/**/*.hbs', ['assemble']
  gulp.watch './src/**/*.scss', ['css']

gulp.task 'default', ['build-scripts'], ->
  console.log "finished"

