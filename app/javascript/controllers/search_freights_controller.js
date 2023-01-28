import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-freights"
export default class extends Controller {
  static targets = ["content"];
  connect() {
  }
}
