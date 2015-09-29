/*jslint node: true */
"use strict";

module.exports = function(grunt) {

  // Change the path to point to your local package.json
  // All of this config is examples for various common grunt tasks.
  // Similarly change the paths to your scss/css/map files below.
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

    // use grunt.loadTasks if your node_modules folder isn't in the same place
    // as your gruntfile
    // i.e. grunt.loadTasks('../node_modules/grunt-sass/tasks');
    // you need to explicitly specify the tasks folder.
    grunt.loadNpmTasks('grunt-sass');
    grunt.loadNpmTasks('grunt-contrib-cssmin');

    grunt.registerTask('build-Debug', ['sass', 'cssmin']);
    grunt.registerTask('build-Release', ['sass', 'cssmin']);
};
