import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["region", "city"]

  changeRegion(event) {

    let regionId = event.target.value
    let citySelect = this.cityTarget

    citySelect.options.length = 0

    fetch(`/cities?region_id=${regionId}`)
      .then(response => response.json())
      .then(cities => {
        cities.forEach(city => {
          let option = new Option(city.name, city.id)
          citySelect.appendChild(option)
        })
      })
  }

}
