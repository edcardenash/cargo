import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"
// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  };

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12",
      center: [0, 0],
      zoom: 15,
      interactive: false

    });

    const directions = new MapboxDirections({
      accessToken: this.apiKeyValue,
      unit: 'metric',
      profile: 'mapbox/driving',
      alternatives: false,
      geometries: 'geojson',
      controls: {
        inputs: false,
        instructions: false },
      flyTo: false
    });

    const geoLocate = new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
        },
        trackUserLocation: true,
        showUserHeading: true
    });

    const ruta = (lat, lng, end_lat, end_lng)=>{
      this.map.on('load', () => {
        directions.setOrigin([lat, lng]);
        directions.setDestination([end_lat, end_lng]);
        let bounds = new mapboxgl.LngLatBounds();
        bounds.extend([lat, lng]);
        bounds.extend([end_lat, end_lng]);
        this.map.fitBounds(bounds, {
          padding: 90,
          duration: 1000
        });
      })
    };

    ruta(this.markersValue[0]['lng'], this.markersValue[0]['lat'],  this.markersValue[0]['end_lng'],this.markersValue[0]['end_lat']);
    this.map.addControl(directions);
    this.map.addControl(geoLocate);
  }
}
