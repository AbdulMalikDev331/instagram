document.addEventListener("turbolinks:load", function () {
  $("#Submit-Story").on("click", function () {
    const desc = document.getElementById("story-desc").value;
    let desc_err = document.getElementById("story-desc-err");
    const img = document.getElementById("story-img").value;
    let img_err = document.getElementById("story-img-err");
    if (desc == "") {
      desc_err.textContent = "* Description Required"
      desc_err.style.color = "red"
    } else if (desc != "") {
      desc_err.textContent = ""
      desc_err.style.color = "red"
    }
    if (img == "") {
      img_err.textContent = "* Images Required"
      img_err.style.color = "red"
    } else if (img != "") {
      img_err.textContent = ""
      img_err.style.color = "red"
    }
    if (desc_err.textContent == "") {
      return true;
    } else {
      return false;
    }
  })
})
