import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="search-address"
export default class extends Controller {

  static targets = ["formulario", "input", "list"]

  connect() {

    const ACCESS_TOKEN = 'pk.eyJ1IjoiZWFsdGFtaXIiLCJhIjoiY2xkbjh4ZXRpMGgzdzNua2I2bGs1aGx0NiJ9.t3wEyM5y-oHLyCAtOJDSFw';

    const script = document.getElementById('search-js');
    script.onload = () => {
        const collection = mapboxsearch.autofill({
            accessToken: ACCESS_TOKEN
        });
    };

    // mapboxgl.accessToken = 'pk.eyJ1IjoiZWFsdGFtaXIiLCJhIjoiY2xkbjh4ZXRpMGgzdzNua2I2bGs1aGx0NiJ9.t3wEyM5y-oHLyCAtOJDSFw';
    // const script = document.getElementById('search-js');
    // script.onload = () => {
    //     const elements = document.querySelectorAll('mapbox-address-autofill');
    //     for (const autofill of elements) {
    //       console.log( mapboxgl.accessToken);
    //         autofill.accessToken =  mapboxgl.accessToken;
    //     }
    // };


    // const scriptEndDirection = document.getElementById('search-js');
    // scriptEndDirection.onload = () => {
    //     const elements = document.querySelectorAll('mapbox-endAddress-autofill');
    //     for (const autofill of elements) {
    //         autofill.accessToken =  mapboxgl.accessToken;
    //     }
    // };

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
