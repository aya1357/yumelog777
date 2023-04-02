// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "./packs/studies_new.js"
import "./packs/calendars_index.js"
import "./packs/logs_culc.js"
import "./packs/start.js"
import "./packs/calendars_studies_status.js"
import "./packs/dayOfWeek_default.js"
import jquery from "jquery"
window.$ = window.jQuery = jquery
