import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-post-to-list"
export default class extends Controller {
  static targets = ["posts", "form", "results"]
  static values = { position: String }
  connect() {
    // console.log(this.postsTarget)
    // console.log(this.formTarget)
    // console.log(this.resultsTarget)
    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
  }

  send(event) {
    // console.log("formTarget", this.formTarget.action)
    // console.log(event)
    event.preventDefault()
    // console.log("event", event.params.id)
    // console.log("events3", event.currentTarget)

    // console.log("form targets", this.formTargets)
    // console.log('dataset', this.formTargets[0].dataset.id)
    const url = event.currentTarget.action
    const options = {
      method: "POST",
      headers: { "Accept": "application/json", "X-CRSF-Token": this.csrfToken },
      body: new FormData(event.currentTarget)
    }

    fetch(url, options)
      .then(response => response.json())
      .then((data) => {
        // console.log("data", data)
        if (data.inserted_item) {
          this.postsTarget.insertAdjacentHTML(this.positionValue, data.inserted_item)
          // console.log("post target", this.postsTarget)
          // console.log("position value ", this.positionValue)
        }
        // // this.resultsTarget.outerHTML = data.form
        // console.log("data.form", data.form)
        // console.log("results target", this.resultsTarget)
      })
  }
}
