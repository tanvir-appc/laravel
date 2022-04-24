// var gulp = require('gulp');
// var uglify = require('gulp-uglify');
// var autoprefixer = require('gulp-autoprefixer');
// var sourcemaps = require('gulp-sourcemaps');
// var sass = require('gulp-sass')(require('sass'));
// var imagemin = require('imagemin');
// import imagemin from 'gulp-imagemin';

import gulp from 'gulp';
import watch from 'gulp';
import uglify from 'gulp-uglify';
import autoprefixer from 'gulp-autoprefixer';
import sourcemaps from 'gulp-sourcemaps';
import purgecss from 'gulp-purgecss';

// import sass
import dartSass from 'sass';
import gulpSass from 'gulp-sass';
const sass = gulpSass( dartSass );

import imagemin from 'gulp-imagemin';
import webp from 'gulp-webp';
import mozjpeg from 'imagemin-mozjpeg';
import gifsicle from 'imagemin-gifsicle';
import optipng from 'imagemin-optipng';
import svgo from 'imagemin-svgo';
import pngquant from 'imagemin-pngquant';
import del from 'del';
import concat from 'gulp-concat';
import cleanCSS from 'gulp-clean-css';



gulp.task('processHomeJS', function() {
  return gulp.src([
      './public/home.js',
      ])
  .pipe(uglify({
     // preserveComments: 'license',
     compress: { hoist_funs: false }
  }))
  .pipe(concat('home.min.js'))
  .pipe(gulp.dest('public'));
});
gulp.task('processUniJS', function() {
  return gulp.src([
      './public/main.js',
      ])
  .pipe(uglify({
     // preserveComments: 'license',
     compress: { hoist_funs: false }
  }))
  .pipe(concat('main.min.js'))
  .pipe(gulp.dest('public'));
});

gulp.task('processCSS', function() {
  return gulp.src('./public/scss/**/*.scss')
  .pipe(sass())
  .pipe(sourcemaps.init())
  .pipe(autoprefixer())
  .pipe(concat('style.min.css'))
  .pipe(cleanCSS({compatibility: 'ie8'}))
  .pipe(sourcemaps.write())
  .pipe(gulp.dest('public'));
});

gulp.task('processIMAGE', function() {
  return gulp.src('./public/images/**/*')
  .pipe(imagemin({'progressive':true,'use':[
		gifsicle({interlaced: true}),
		mozjpeg({quality: 100, progressive: true}),
		optipng({optimizationLevel: 2}),
		svgo({
			plugins: [
				{removeViewBox: true},
				{cleanupIDs: false}
			]
		}),
		pngquant()
	]}))
  .pipe(webp())
  .pipe(gulp.dest('./public/images/webp'));
});

gulp.task('clean:build', function () {
  return del([
    './public/main.min.js',
    './public/style.min.css',
    './public/home.min.js',
  ]);
});

gulp.task('purgecss', () => {
    return gulp.src('./public/tailwind.min.css')
        .pipe(purgecss({
            content: ['./resources/views/**/*.php']
        }))
        .pipe(gulp.dest('./public/scss'))
})

// gulp.task('default', gulp.series(['clean:build','processJS', 'processCSS','processIMAGE']),function(){
// 	return;
// });
// gulp.task('watch', function () {
//     return gulp.watch(['./src/js/new/*.js','./src/scss/**/*.scss'], gulp.series(['clean:build','processCSS','processJS']));
// });
gulp.task('default', gulp.series(['clean:build','processCSS','processHomeJS','processUniJS']),function(){
  return;
});