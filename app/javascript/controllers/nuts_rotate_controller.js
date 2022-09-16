import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nuts-rotate"
export default class extends Controller {
  static targets=["nutOne", "nutTwo", "nutThree"]
  connect() {
    console.log("BOOM")
  }

  rotate() {
    this.nutOneTarget.style.transform = "rotate("+ (window.pageYOffset/16) + "deg)"
    this.nutTwoTarget.style.transform = "rotate("+ (window.pageYOffset/8) + "deg)"
    this.nutThreeTarget.style.transform = "rotate("+ (window.pageYOffset/2) + "deg)"

    };
}
