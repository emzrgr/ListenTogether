document.addEventListener("DOMContentLoaded", function () {
  const likeButton = document.getElementById("like-button");
  const lookButton = document.getElementById("look-button");

  if (likeButton && lookButton) {
    // afiche btn like quand look cliqué 
    lookButton.addEventListener("click", function () {
      likeButton.classList.remove("d-none");
    });

    // cache à nouveau 
    likeButton.addEventListener("click", function () {
      likeButton.classList.add("d-none");
    });
  }
});