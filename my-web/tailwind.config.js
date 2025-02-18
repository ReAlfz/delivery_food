import defaultTheme from 'tailwindcss/defaultTheme';

/** @type {import('tailwindcss').Config} */
export default {
    content: [
        './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
        './storage/framework/views/*.php',
        './resources/**/*.blade.php',
        './resources/**/*.js',
        './resources/**/*.vue',
    ],
    safelist: [
        'fixed-justify',
        'skill-card',
    ],

    theme: {
        container: {
            center: true,
            padding: {
                default: '16px',
                lg: '52px',
            },
        },
        extend: {
            animation: {
                slowbounce: "bounce 3s infinite"
              },
            fontFamily: {
                sans: ['Figtree', ...defaultTheme.fontFamily.sans],
                montserrat: ['Montserrat'],
                nunito: ['Nunito'],
                merriweather: ['Merriweather'],
            },
            colors: {
                white: '#F9F9F9',
                primary: '#0087B8',
                secondary: "#522B29",
                dark: '#1F1F1F',
            }
        },
    },
    plugins: [],
};
