import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cars"
export default class extends Controller {
  // static targets = ["carsElement"]
  connect() {
    console.log("Hello from toggle_controller.jsCA")
  }
}
