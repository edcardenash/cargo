import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {

  static values = {
    apiKey: String,
    markers: Array
  };


  connect() {
    console.log()
    const freightGallery = cloudinary.galleryWidget({
      container: "#freight-gallery",
      cloudName: "dpobz3mzq"
      //mediaAssets: [{ tag: "clock" }]    // by default mediaType: "image"
    });
    freightGallery.render()
  };
}
