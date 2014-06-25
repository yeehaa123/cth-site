module.exports =
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
