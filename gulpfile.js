'use strict'

var gulp        = require('gulp')
  , bump        = require('gulp-bump')
  , filter      = require('gulp-filter')
  , git         = require('gulp-git')
  , purescript  = require('gulp-purescript')
  , runSequence = require('run-sequence')
  , tagVersion  = require('gulp-tag-version')
  ;

var paths =
    { src: 'src/**/*.purs'
    , bowerFFIJs: [ 'bower_components/purescript-*/src/**/*.js'
                  ]
    , bowerSrc: [ 'bower_components/purescript-*/src/**/*.purs'
                ]
    , dest: ''
    , docgen: { 'Data.Tagged': 'docs/Data/Tagged.md'
              , 'Optic.Equality': 'docs/Optic/Equality.md'
              , 'Optic.Extended': 'docs/Optic/Extended.md'
              , 'Optic.Fold': 'docs/Optic/Fold.md'
              , 'Optic.Internal.Iso': 'docs/Optic/Internal/Iso.md'
              , 'Optic.Iso': 'docs/Optic/Iso.md'
              , 'Optic.Monad': 'docs/Optic/Monad.md'
              , 'Optic.Monad.Getter': 'docs/Optic/Monad/Getter.md'
              , 'Optic.Monad.Setter': 'docs/Optic/Monad/Setter.md'
              , 'Optic.Review': 'docs/Optic/Review.md'
              , 'Optic.Traversal': 'docs/Optic/Traversal.md'
              , 'Optic.Types.Extended': 'docs/Optic/Types/Extended.md'
              }
    , outputJs: 'output/**/*.js'
    };

gulp.task('tag', function() {
    return gulp.src(['bower.json', 'package.json'])
        .pipe(git.commit('Update versions.'))
        .pipe(filter('bower.json'))
        .pipe(tagVersion());
});

// For whatever reason, these cannot be factored out...
gulp.task('bump-major', function() {
    return gulp.src(['bower.json', 'package.json'])
        .pipe(bump({type: 'major'}))
        .pipe(gulp.dest('./'));
});
gulp.task('bump-minor', function() {
    return gulp.src(['bower.json', 'package.json'])
        .pipe(bump({type: 'minor'}))
        .pipe(gulp.dest('./'));
});
gulp.task('bump-patch', function() {
    return gulp.src(['bower.json', 'package.json'])
        .pipe(bump({type: 'patch'}))
        .pipe(gulp.dest('./'));
});

gulp.task('bump-tag-major', function() {
    return runSequence('bump-major', 'tag');
});
gulp.task('bump-tag-minor', function() {
    return runSequence('bump-minor', 'tag');
});
gulp.task('bump-tag-patch', function() {
    return runSequence('bump-patch', 'tag');
});

gulp.task('psc', function() {
    return purescript.psc({
        src: paths.bowerSrc.concat(paths.src),
        ffi: paths.bowerFFIJs
    });
});

gulp.task('docs', function() {
    return purescript.pscDocs({
        src: paths.bowerSrc.concat(paths.src),
        docgen: paths.docgen
    });
});

gulp.task('watch', function() {
    gulp.watch([paths.src], function() {
      return runSequence('psc', 'docs')
    });
});

gulp.task('default', function() {
  return runSequence('psc', 'docs')
});
