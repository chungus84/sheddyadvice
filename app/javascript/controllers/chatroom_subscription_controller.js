import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages"]


  connect() {
    // console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)

    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      // { received: data => console.log(data) }
      // { received: data => this.messagesTarget.insertAdjacentHTML("beforeend", data) },
      { received: (data) => {this.#insertMessageAndScrollDown(data)} }
    )
}
  resetForm(event) {
    event.target.reset()
  }

#insertMessageAndScrollDown(data) {
  this.messagesTarget.insertAdjacentHTML("beforeend", data)
  // scroll to the bottom of the messages
  this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
