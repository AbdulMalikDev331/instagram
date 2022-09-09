document.addEventListener("turbolinks:load", function () {
  $("#post-submit").on("click", function () {
    const desc = document.getElementById("post-desc").value;
    let desc_err = document.getElementById("post-desc-err");
    const img = document.getElementById("post-img").value;
    let img_err = document.getElementById("post-img-err");
    let numFiles = $("#post-img")[0].files.length;
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
    if (numFiles > 10) {
      img_err.textContent = "* Maxmium of 10 Files"
      img_err.style.color = "red"
    }
    if (desc_err.textContent == "") {
      return true;
    } else {
      return false;
    }
  })
})
