/*jslint node: true */
"use strict";

module.exports = function(grunt) {

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    sass: {
      options: {
        sourceMap:'content/styles.css.map'
      },
      dist: {
        files: {
          'content/styles.css': 'content/styles.scss'
        }
      }
    },
    cssmin: {
      target: {
        files: [{
          expand: true,
          cwd: 'content',
          src: ['*.css', '!*.min.css'],
          dest: 'content',
          ext: '.min.css'
        }]
      }
    });

    grunt.loadNpmTasks('grunt-sass');
    grunt.loadNpmTasks('grunt-contrib-cssmin');

    grunt.registerTask('build-Debug', ['sass']);
    grunt.registerTask('build-Release', ['sass']);
};
