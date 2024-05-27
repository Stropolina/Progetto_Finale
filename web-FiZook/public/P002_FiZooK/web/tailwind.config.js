/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["*.html", "./js/*.js", "./pages/*.html"],
  //conent: ["html", "**/*.{html,js}"],
  theme: {
    extend: {},
  },
  plugins: [require('@tailwindcss/forms'),],
  darkMode: 'false',
}

