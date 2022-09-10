import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="instructions-dropdown"
export default class extends Controller {
  static targets=["toggle", "dropdown"]
  connect() {
    console.log("bum")
  }

  reveal (){

    this.dropdownTarget.classList.toggle('d-none')
    this.toggleTarget.classList.toggle('rotate')
  }
}
