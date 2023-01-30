import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="search-address"
export default class extends Controller {

  connect() {
    mapboxgl.accessToken = 'pk.eyJ1IjoiZWFsdGFtaXIiLCJhIjoiY2w5cnN3N3prMGpzZjNwcW0yNTR4ZHl3bCJ9.A2gb3u3Tz6cgIDG4zLs7yw'
    const geocoder = new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      types: 'country,region,place,postcode,locality,neighborhood'
  });

  geocoder.addTo('#geocoder');
  }
}
