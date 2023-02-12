// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "./packs/studies_new.js"
import "./packs/calendars_index.js"
import jquery from "jquery"
window.$ = window.jQuery = jquery
