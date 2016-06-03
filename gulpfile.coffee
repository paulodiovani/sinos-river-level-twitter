del       = require('del')
gulp      = require('gulp')
docco     = require('docco')
deploy    = require('gulp-deploy-git')
connect   = require('gulp-connect')
filenames = require("gulp-filenames")

gulp.task 'clean', ->
  del(['./docs/**/*'])

gulp.task 'clean-tmp', ['docco'], ->
  del(['./docs/tmp/**/*'])

gulp.task 'docco', ['clean'], (cb) ->
  gulp.src './lib/**/*.coffee'
    .pipe filenames('coffeescript')
    .pipe gulp.dest('./docs/tmp')
    .on 'end', ->
      docco.document
        args: filenames.get('coffeescript', 'full')
        output: "#{process.cwd()}/docs"
      , cb
  return

gulp.task 'serve', ['docco'], ->
  connect.server(root: ['./docs'])

gulp.task 'deploy-docs', ['clean', 'docco', 'clean-tmp'], ->
  gulp.src './docs/**/*', read: false
    .pipe deploy
      prefix: 'docs'
      repository: 'https://github.com/paulodiovani/sinos-river-level-twitter'
      remoteBranch: 'gh-pages'
      verbose: true

gulp.task 'default', ['clean', 'docco', 'clean-tmp', 'serve']
