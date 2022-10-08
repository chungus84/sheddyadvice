import Carousel from 'stimulus-carousel'

export default class extends Carousel {
  connect() {
    super.connect()

    // The swiper instance.
    this.swiper

    // Default options for every carousels.
    this.defaultOptions

  }

  // You can set default options in this getter.
  get defaultOptions() {
    return {
      // Your default options here
    }
  }


}
