"use strict";

var gulp = require("gulp");
var concat = require("gulp-concat");
var minify = require("gulp-minify");
var sass = require("gulp-sass");
var minifyCss = require("gulp-minify-css");
var browserSync = require("browser-sync");

var options = {
    port: 8080,
    open: false, // don't open new tab in browser,
    reloadOnRestart: true,
    logFileChanges: true,
    server:{
        baseDir: ["./"]
    }
};

var reload = browserSync.reload;

var filesToWatch = [
    "./assets/js/**/*.js",
    "./assets/scss/**/*.scss"  
];

var scriptFilesToConcat = [
    "./assets/js/jquery.touchSwipe.min.js",
    "./assets/js/jBox.js"
];

var scriptFile = "jBox.js";
var scriptDestFolder = "./js"

var sassFileToCompile = "./assets/scss/jBox.scss";
var cssDestFolder = "./css";


gulp.task("scripts", function(){
    return gulp
        .src(scriptFilesToConcat)
        .pipe(concat(scriptFile))
        .pipe(minify())
        .pipe(gulp.dest(scriptDestFolder));
});

gulp.task("sass", function(){
    return gulp
        .src(sassFileToCompile)
        .pipe(sass().on("error", sass.logError))
        .pipe(minifyCss())
        .pipe(gulp.dest(cssDestFolder))
        .pipe(browserSync.stream());
});

gulp.task("watch", function(){
    browserSync(options);
    gulp.watch(filesToWatch, ["scripts", "sass"]).on("change", reload); 
});