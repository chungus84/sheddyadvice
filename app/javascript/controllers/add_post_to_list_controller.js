import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-post-to-list"
export default class extends Controller {
  static targets = ["posts", "form", "results"]
  static values = { position: String }
  connect() {
    console.log(this.postsTarget)
    console.log(this.formTarget.action)
    console.log(this.resultsTarget)
    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
  }

  // send(event) {
  //   // console.log(this.formTarget.action)
  //   // console.log(event)
  //   event.preventDefault()
  //   const url = this.formTarget.action
  //   const options = {
  //     method: "POST",
  //     headers: { "Accept": "application/json", "X-CRSF-Token": this.csrfToken },
  //     body: new FormData(this.formTarget)
  //   }
  //   fetch(url, options)
  //     .then(response => response.json())
  //     .then((data) => {
  //       console.log(data.inserted_item)
  //       // if (data.inserted_item) {
  //       //   this.postsTarget.insertAdjacentHTML(this.positionValue, data.inserted_item)
  //       // }
  //       // this.resultsTarget.outerHTML = data.form
  //     })
  // }
}
