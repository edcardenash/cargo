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
