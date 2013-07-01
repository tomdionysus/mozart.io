/*global module */

module.exports = function (grunt) {

    // Load additional modules.
    grunt.loadNpmTasks('grunt-coffeelint');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-handlebars');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-regarde');

    // Load our custom tasks.
    grunt.loadTasks('config/tasks');

    /**
     * Define our Grunt configuration.
     */
    grunt.initConfig({

        clean: {
            build: ['./public/*','./.sass-cache/*','build']
        },

        copy: {
            compile: {
                files: [{
                    expand: true,
                    src: "**",
                    cwd: "app/assets/",
                    dest: "public/"
                }]
            }
        },

        // Handle compiling our app.
        coffee: {
            compile: {
                files: {
                    'build/application.js': [
                        // The boot file needs to come first.
                        'app/config/boot.coffee',

                        // Plugins
                        'app/plugins/*.coffee',
                        'app/plugins/**/*.coffee',

                        // Models.
                        'app/models/*.coffee',

                        // Include the base controllers first, then the classes that extend them.
                        'app/controllers/*.coffee',
                        'app/controllers/steps/*.coffee',

                        // Likewise include the base views first, then the classes that extend them.
                        'app/views/*.coffee',
                        'app/views/**/*.coffee',

                        // The app itself needs to be last.
                        'app/config/app.coffee'
                    ]
                }
            }
        },

        // Handle concatenating our various files
        uglify: {
            app: {
                files: {
                    'public/js/app.min.js': [
                        'build/application.js',
                        'build/templates.js'
                    ]
                }
            }
        },

        // Provide the ability to generate classes.
        generate: {
            name: 'App',
            root: 'app/'
        },

        // Handle compiling our templates.
        handlebars: {
            compile: {
                options: {
                    namespace: 'HandlebarsTemplates',
                    processName: function (original) {
                        return original.replace('.hbs', '');
                    },
                    wrapped: true
                },
                files: {
                    'build/templates.js': 'app/templates/**/*.hbs'
                }
            }
        },

        // Parameters for our custom SASS invoker.
        sass: {
            app: {
                src: 'app/scss/',
                dest: 'public/css/'
            }
        },

        // Integration server for serving up static demo app
        integration: {
            port: 8080,
            base: './public'
        },

        // Compile MessageFormat JSON files
        messageformat: {
            app: {
                src: "app/lang",
                dest: "public/js/i18n"
            }
        },

        /**
         * Allow Grunt to run by itself.
         */
        regarde: {
            assets: {
                files: 'app/assets/**/*',
                tasks: ['copy']
            },
            app: {
                files: 'app/**/*.coffee',
                tasks: ['coffee','uglify']
            },
            handlebars: {
                files: 'app/templates/**/*.hbs',
                tasks: ['handlebars','uglify']
            },
            scss: {
                files: 'public/scss/**/*.scss',
                tasks: ['sass']
            },
            messageformat: {
                files: 'app/lang/**/*.json',
                tasks: ['messageformat']
            }
        }
    });

    // Build task
    grunt.registerTask('build', ['clean', 'copy', 'coffee', 'handlebars', 'uglify', 'sass', 'messageformat']);

    // Dev run task
    grunt.registerTask('run', ['build', 'integration', 'regarde']);
};
