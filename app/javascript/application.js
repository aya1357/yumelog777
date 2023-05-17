// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "./packs/studies_new.js"
import "./packs/calendars_index.js"
import "./packs/logs_culc.js"
import "./packs/top_culc.js";
import "./packs/calendars_studies_status.js"
import "./packs/dayOfWeek_default.js"
import "./packs/study_pages_comparison.js"
import "./packs/top_animation.js"
import "./packs/guide_change.js"
import "./packs/today_books_accordion.js"
import "./packs/logs_not_read_books.js"
import "./packs/book_progress.js"
import "./packs/calendar_hover_books_index.js"
import "./packs/log_chart_ajax.js"
import jquery from "jquery"
import "chartkick";
import "chartkick/chart.js";
window.$ = window.jQuery = jquery
