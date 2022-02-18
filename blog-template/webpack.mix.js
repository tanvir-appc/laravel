const mix = require('laravel-mix');
require('laravel-mix-purgecss');
// import mix from 'laravel-mix';

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel applications. By default, we are compiling the CSS
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/js/app.js', 'public/js')
    .postCss('resources/css/app.css', 'public/css', [
        //
    ])
 //    .options({
 //         postCss: [require('tailwindcss')]
	// })
	.purgeCss();
// mix.styles([
// 	'public/scss/tailwind.min.css',
//     'public/scss/main.scss',
// ], 'public/css/all.min.css').purgeCss();
// mix.scripts([
//     'public/main.js',
//     'public/home.js'
// ], 'public/js/all.min.js').version();;