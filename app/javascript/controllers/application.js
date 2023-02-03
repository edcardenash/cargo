import { Application } from "@hotwired/stimulus"
import 'lightgallery/css/lightgallery.css'

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
