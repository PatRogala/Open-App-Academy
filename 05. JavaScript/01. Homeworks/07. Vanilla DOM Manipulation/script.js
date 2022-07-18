document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  const addFavorite = (e) => {
    e.preventDefault();
    const input = document.getElementsByClassName("favorite-input")[0];
    const newLi = document.createElement("li");
    newLi.textContent = input.value;
    document.querySelector("#sf-places").appendChild(newLi);
  }
  // --- your code here!
  document.querySelectorAll(".favorite-submit").forEach((submit) => {
    submit.addEventListener("click", addFavorite);
  });


  // adding new photos
  const showForm = (e) => {
    e.preventDefault();

    document.getElementsByClassName("photo-form-container")[0].className = "photo-form-container";
  }
  // --- your code here!

  document.querySelectorAll(".photo-show-button").forEach((button) => {
    button.addEventListener("click", showForm);
  });

  const addPhoto = (e) => {
    e.preventDefault();
    const input = document.getElementsByClassName("photo-url-input")[0];
    const newLi = document.createElement("li");
    const newImg = document.createElement("img");
    newImg.src = input.value;
    newLi.appendChild(newImg);
    document.querySelector(".dog-photos").appendChild(newLi);
  }

  document.querySelectorAll(".photo-url-submit").forEach((submit) => {
    submit.addEventListener("click", addPhoto);
  });

});
