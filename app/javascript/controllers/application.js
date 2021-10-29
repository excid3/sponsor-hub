import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.warnings = true
application.debug    = false
window.Stimulus      = application

// setup bootstrap javascript
import "bootstrap"
import {Tooltip, Popover, Dropdown} from 'bootstrap'
document.addEventListener("turbo:load",() => {
    document.querySelectorAll('[data-bs-toggle="tooltip"]').forEach(element => new Tooltip(element))
    document.querySelectorAll('[data-bs-toggle="popover"]').forEach(element => new Popover(element))
    document.querySelectorAll('[data-bs-toggle="dropdown"]').forEach(element => new Dropdown(element))
});

export { application }
