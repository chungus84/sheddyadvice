import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="post-dropdown"
export default class extends Controller {
  static targets = ["menu" , "menuBody"]
  connect() {
    console.log("WOTCHA")
  }

  displayMenu () {
    this.menuBodyTarget.classList.remove("d-none")
  }

}
