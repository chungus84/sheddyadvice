import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-fields"
export default class extends Controller {
  static targets = ["post", "form", "bodyForm", "button", "info"]

  connect() {
    console.log("hello")

    }

  displayForm() {
    this.formTarget.classList.remove('d-none')
    this.postTarget.classList.add('d-none')
  }

  update(event) {
    event.preventDefault()
    const url = this.formTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
         this.infoTarget.outerHTML = data
      })
  //  this.buttonTarget.classList.add('d-none')

  }
}
