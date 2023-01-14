// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "./packs/habits_new.js"
import jquery from "jquery"
window.$ = window.jQuery = jquery
