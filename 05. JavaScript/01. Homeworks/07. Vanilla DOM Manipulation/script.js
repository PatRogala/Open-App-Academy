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

  // --- your code here!



});
