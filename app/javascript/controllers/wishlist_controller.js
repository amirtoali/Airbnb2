import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="wishlist"
export default class extends Controller {
  connect() {
  }
  updatewishlistStatus(){
    if(this.element.dataset.status==="false"){
    this.element.classList.remove("bi-heart")
    this.element.classList.add("bi-heart-fill")
    this.element.dataset.status="true";
  }
    else{
    this.element.classList.remove("bi-heart-fill")
    this.element.classList.add("bi-heart")
    this.element.dataset.status="false";
 }
  }
}
