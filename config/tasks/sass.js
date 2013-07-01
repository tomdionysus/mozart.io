/*global module require */

/**
 * Custom task for invoking the Ruby SASS gem.
 */
module.exports = function(grunt){

    // Create the task.
    grunt.registerMultiTask('sass', 'Invokes the Ruby SASS gem.', function(){

        // Dependencies.
        var exec = require('child_process').exec;

        // Grab the config.
        var done = this.async();
        var command = 'sass --force --update ' + this.data.src + ':' + this.data.dest;

        // Execute the command.
        exec(command, function(error, stdout, stderr){

            if (error === null) {
                console.log('Successfully recompiled SASS.');
            }
            else {
                grunt.warn('SASS compilation failed: \n' + stdout);
            }

            done(error, stderr, error);
        });
    });
};