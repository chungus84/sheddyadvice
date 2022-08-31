import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-review-in-list"
export default class extends Controller {
  static targets = ["reviews", "form"]
  static values = { position: String }
  // connect() {
  //   // console.log("Added")
  //   // console.log(this.reviewsTarget)
  //   // console.log(this.formTarget)
  // F

  send(event) {
    event.preventDefault()
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.reviewsTarget.insertAdjacentHTML(this.positionValue, data.inserted_item)
        }
        this.formTarget.outerHTML = data.form
      })
  }
}
