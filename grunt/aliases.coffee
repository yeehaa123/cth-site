module.exports =
  default: [
    'newer:bowercopy'
    'newer:copy'
    'newer:imagemin'
    'newer:concat'
    'css'
    'newer:assemble'
    'connect'
    'notify:default'
  ]

  css: [
    'sass'
    'newer:autoprefixer'
    'notify:css'
  ]

