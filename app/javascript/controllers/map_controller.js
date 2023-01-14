import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"
// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
  };

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12",
      center: [-122.662323, 45.523751],
      zoom: 12
    });
    this.#addMarkersToMap();
    this.#fitMarkersToMap();
    // this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
    // mapboxgl: mapboxgl }))
  }
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)
      new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(this.map)
    })
  }
  #fitMarkersToMap(){
    const bounds = new mapboxgl.LngLatBounds();
      this.markersValue.forEach(markers => bounds.extend([markers.lng, markers.lat]))
      this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })}

}
