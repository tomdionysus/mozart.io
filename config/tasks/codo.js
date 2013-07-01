/*global module require */

/**
 * Custom task for invoking Codo Documentation Generator
 */
module.exports = function(grunt){

    // Create the task.
    grunt.registerMultiTask('codo', 'Invokes the Codo Documentation Generator.', function(){

        // Dependencies.
        var exec = require('child_process').exec;

        // Grab the config.
        var done = this.async();
        var command = './node_modules/.bin/codo  -o docs -n "' + this.data.name + '" -title "' + this.data.title + '" app/mozart/ ' + this.data.src ;

        // Execute the command.
        exec(command, function(code, stdout, stderr){
            console.log('Successfully generated docs.');
            done(code, stderr, code);
        });
    });
};