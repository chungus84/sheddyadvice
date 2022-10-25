import { Application } from "@hotwired/stimulus"
// import 'swiper/swiper-bundle.min.css'
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
