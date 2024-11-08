import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="wishlist"
export default class extends Controller {
  connect() {
  }
  updatewishlistStatus(){
     const isUserLoggedIn = this.element.dataset.userLoggedIn;
     if(isUserLoggedIn=="false"){
      document.getElementById("login_id").click()
      return
     }
    if(this.element.dataset.status.trim()==="false"){
      console.log(this.element.dataset.status)
      const userId = this.element.dataset.userId;
      const proptryId = this.element.dataset.proptryId;
      console.log(userId);
      console.log(proptryId);
      //window.location.reload()
     this.addToProptry(proptryId,userId )
    this.element.dataset.status="true";
  }
    else{
    const wishlistid = this.element.dataset.wishlistId;
    console.log(wishlistid)
    this.removewishlist(wishlistid)
    console.log(this.element.dataset.status)
   // window.location.reload()
    this.element.dataset.status="false";
   

 }
  }
  addToProptry(proptryId,userId ){

// Form data to be sent in the request body
    const Data = {
      user_id: userId,
      property_id: proptryId,
    };

    // Make a POST request using the Fetch API
    fetch("/api/wishlist/", {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(Data),
    })
      .then(response => {
        if (response.ok) {
         this.element.classList.remove("bi-heart")
         this.element.classList.add("bi-heart-fill")
         debugger
        }
        return response.json();
      })
      .catch(error => {
        console.error('Error:', error);
      });
  }
 removewishlist(id){
  fetch(`/api/wishlist/${id}`, {
  method: 'DELETE',
})
      .then(response => {
        if (response.ok) {
     this.element.classList.remove("bi-heart-fill")
     this.element.classList.add("bi-heart")
     this.element.dataset.wishlistId = "";
        }
        return response.json();
      })
 }
}
