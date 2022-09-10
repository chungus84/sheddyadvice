import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="post-dropdown"
export default class extends Controller {
  static targets = ["menu" , "menuBody", "addIcon", "listDropdown"]
  connect() {
  }

  displayMenu () {
    this.menuBodyTarget.classList.toggle("d-none")
  }

  displayLists () {
    this.listDropdownTarget.classList.toggle("d-none")
  }

}
