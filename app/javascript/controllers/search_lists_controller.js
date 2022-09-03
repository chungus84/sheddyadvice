import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-lists"
export default class extends Controller {
  static targets = ["form", "input", "list", "searchbar", "dropdownlist"]

  connect() {
    // console.log(this.formTarget.action);
    // console.log(this.listTarget);
    // console.log(this.inputTarget.value);
  }

  update() {

    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`;
    // console.log(this.listTarget.innerHTML)
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        // console.log(Object.values(data))
        // this.listTarget.innerHTML = "";
        this.listTarget.outerHTML = data;
        console.log("lewag", data)

        this.dropdownlistTargets.forEach((target) => {
          console.log(target)

          target.classList.remove("d-none");
        })
        // console.log(this.listTarget.innerHTML)
    })
    debugger
  }

  show() {
    this.dropdownlistTargets.forEach((target) => {
      target.classList.remove("d-none");
  })}
}
