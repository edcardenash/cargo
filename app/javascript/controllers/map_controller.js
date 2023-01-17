import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"
// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    lat: Number,
    lon: Number,
    latend: Number,
    lonend: Number
  };

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12",
      center: [this.latValue, this.lonValue],
      zoom: 15
    });

    const directions = new MapboxDirections({
      accessToken: this.apiKeyValue,
      unit: 'metric',
      profile: 'mapbox/driving',
      alternatives: false,
      geometries: 'geojson',
      controls: { instructions: true },
      flyTo: false
    });

    const geoLocate = new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
        },
        // When active the map will receive updates to the device's location as it changes.
        trackUserLocation: true,
        // Draw an arrow next to the location dot to indicate which direction the device is heading.
        showUserHeading: true
    })

    this.map.on('load',  function() {
      console.log(this.latValue, this.lonValue)
      directions.setOrigin([this.latValue, this.lonValue]);
      directions.setDestination([this.latendValue, this.lonendValue]);
      let bounds = new mapboxgl.LngLatBounds();
      bounds.extend([this.latValue, this.lonValue]);
      bounds.extend([this.latendValue, this.lonendValue]);
      this.map.fitBounds(bounds, {
        padding: 90,
        duration: 1000
      });
     })

    this.map.addControl(directions);
    this.map.addControl(geoLocate);

  }
}
