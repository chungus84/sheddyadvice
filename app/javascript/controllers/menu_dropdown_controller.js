import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu-dropdown"
export default class extends Controller {
  static targets=["hamburger" ]

  connect() {
    console.log('HIYAAAA')
  }

  reveal() {
      this.hamburgerTarget.classList.toggle("open");
    }
}
