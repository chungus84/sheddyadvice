import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nuts-rotate"
export default class extends Controller {
  static targets=["nut1", "nut2", "nut3"]
  connect() {
  }

  rotate() {
    if (window.scrollY >= 100) {
    this.nut1Target.classList.add('rotate')
    this.nut2Target.classList.add('rotate')
    this.nut3Target.classList.add('rotate')
  } else {
    this.nut1Target.classList.remove('rotate')
    this.nut2Target.classList.remove('rotate')
    this.nut3Target.classList.remove('rotate')
  }

  }
}
