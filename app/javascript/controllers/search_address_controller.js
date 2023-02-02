import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="search-address"
export default class extends Controller {

  connect() {
    const ACCESS_TOKEN = 'pk.eyJ1IjoiZWFsdGFtaXIiLCJhIjoiY2w5cnN3N3prMGpzZjNwcW0yNTR4ZHl3bCJ9.A2gb3u3Tz6cgIDG4zLs7yw';
    const script = document.getElementById('search-js');
    script.onload = () => {
        const elements = document.querySelectorAll('mapbox-address-autofill');
        for (const autofill of elements) {
            autofill.accessToken = ACCESS_TOKEN;
        }
    };


    const scriptEndDirection = document.getElementById('search-js');
    scriptEndDirection.onload = () => {
        const elements = document.querySelectorAll('mapbox-endAddress-autofill');
        for (const autofill of elements) {
            autofill.accessToken = ACCESS_TOKEN;
        }
    };

    // const originAddress = new MapboxGeocoder({
    //   accessToken: mapboxgl.accessToken
    //   });

    // const destinyAddress = new MapboxGeocoder({
    //   accessToken: mapboxgl.accessToken
    //   });

    // const geocoder = new MapboxGeocoder({
    //   accessToken: mapboxgl.accessToken
    //   });

  // originAddress.addTo('#originAddress');
  // destinyAddress.addTo('#destinyAddress');
  // geocoder.addTo('#geocoder');


  }

  // update() {
  //   const url = `${this.formularioTarget.action}?query=${this.inputTarget.value}`
  //     fetch(url, {headers: {"Accept": "text/plain"}})
  //     .then(response => response.text())
  //     .then((data) => {
  //       console.log(data);
  //     })
  //   }
}
