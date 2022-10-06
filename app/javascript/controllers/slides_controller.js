import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slides"
export default class extends Controller {

  static targets = ['slide', 'carousel']

  connect() {
    this.group()
  }

  group(){

    const next = this.slideTarget.classList.add('next');
    if (!next.length) {
      next = this.slideTarget.siblings(':first');
    }
    next.children(':first-child').clone().appendTo(slideTarget);

    if (next.next().length>0) {
      next.next().children(':first-child').clone().appendTo(this.slideTarget);
    } else {
      this.itemTarget.siblings(':first').children(':first-child').clone().appendTo(this.slideTarget);
    }
  };
  }
