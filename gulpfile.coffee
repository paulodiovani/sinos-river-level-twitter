del       = require('del')
gulp      = require('gulp')
docco     = require('docco')
deploy    = require('gulp-deploy-git')
connect   = require('gulp-connect')
filenames = require("gulp-filenames")

gulp.task 'clean', ->
  del(['./docs/**/*'])

gulp.task 'docco', ['clean'], ->
  gulp.src './lib/**/*.coffee'
    .pipe filenames('coffeescript')
    .on 'end', ->
      docco.document
        args: filenames.get('coffeescript', 'full')
        output: "#{process.cwd()}/docs"

gulp.task 'serve', ['docco'], ->
  connect.server(root: ['./docs'])

gulp.task 'deploy-docs', ['docco'], ->
  gulp.src './docs/**/*', read: false
    .pipe deploy
      prefix: 'docs'
      repository: 'https://github.com/paulodiovani/sinos-river-level-twitter'
      remoteBranch: 'gh-pages'
      verbose: true

gulp.task 'default', ['docco', 'serve']
