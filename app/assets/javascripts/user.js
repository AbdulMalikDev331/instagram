
document.addEventListener("turbolinks:load", function () {
  $("#login_submit_button").on("click", function () {
    const login_email = document.getElementById("login_email").value;
    const login_password = document.getElementById("login_password").value;
    let login_email_error = document.getElementById("login_email_error");
    let login_password_error = document.getElementById("login_password_error");
    let error_flag = false;
    if (login_email == "") {
      login_email_error.textContent = "* Email Required"
      login_email_error.style.color = "red"
      error_flag = true;
    } else if (login_email != "") {
      login_email_error.textContent = ""
      login_email_error.style.color = "red"
      error_flag = false;
    }
    if (login_password == "") {
      login_password_error.textContent = "* Password Required"
      login_password_error.style.color = "red"
      error_flag = true;
    } else if (login_password != "" && login_password.length < 6) {
      login_password_error.textContent = "* Atleast 6 characters"
      login_password_error.style.color = "red"
      error_flag = true;
    } else if (login_password != "" && login_password.length >= 6) {
      login_password_error.textContent = ""
      login_password_error.style.color = "red"
      error_flag = false;
    }
    if (error_flag == true) {
      return false;
    }
  });
  $("#forgot-password-btn").on("click", function () {
    const forgot_password_email = document.getElementById("email-forgot-password").value;
    let forgot_password_email_error = document.getElementById("forgot_password_email_error");
    if (forgot_password_email == "") {
      forgot_password_email_error.textContent = "* Email Required";
      forgot_password_email_error.style.color = "red";
      return false;
    } else if (forgot_password_email != "") {
      forgot_password_email_error.textContent = "";
      return true;
    }
  });
  $("#SignUp-btn").on("click", function () {
    const signup_username = document.getElementById("username-signup").value;
    let signup_username_error = document.getElementById("signup_username_error");
    const signup_fullname = document.getElementById("fullname-signup").value;
    let signup_fullname_error = document.getElementById("signup_fullname_error");
    const signup_email = document.getElementById("email-signup").value;
    let signup_email_error = document.getElementById("signup_email_error");
    const signup_password = document.getElementById("password-signup").value;
    let signup_password_error = document.getElementById("signup_password_error");
    const signup_confirm_password = document.getElementById("password-confirm-signup").value;
    let signup_confirm_password_error = document.getElementById("signup_confirm_password_error");
    var letters = /^[A-Za-z ]+$/;

    if (signup_email == "") {
      signup_email_error.textContent = "* Email Required";
      signup_email_error.style.color = "red";
    }
    else if (signup_email != "") {
      signup_email_error.textContent = "";
    }
    if (signup_username == "") {
      signup_username_error.textContent = "* Username Required";
      signup_username_error.style.color = "red";
    }
    else if(signup_username.length < 3 || signup_username.length > 24){
      signup_username_error.textContent = "* Username length must be 3-24 characters";
      signup_username_error.style.color = "red";
    }
    else if (signup_username != "") {
      signup_username_error.textContent = "";
    }
    if (signup_fullname == "") {
      signup_fullname_error.textContent = "* Fullname Required";
      signup_fullname_error.style.color = "red";
    }
    else if(signup_fullname.length < 3 || signup_fullname.length > 24){
      signup_fullname_error.textContent = "* Fullname length must be 3-24 characters";
      signup_fullname_error.style.color = "red";
    }
    else if (!signup_fullname.match(letters)){
      signup_fullname_error.textContent = "* Fullname should only contain letters";
      signup_fullname_error.style.color = "red";
    }
    else if (signup_fullname != "") {
      signup_fullname_error.textContent = "";
    }

    if (signup_password == "") {
      signup_password_error.textContent = "* Password Required";
      signup_password_error.style.color = "red";
    } else if (signup_password.length < 6) {
      signup_password_error.textContent = "* Password must be 6 characters long";
      signup_password_error.style.color = "red";
    } else if (signup_password.length >= 6) {
      signup_password_error.textContent = ""
    }
    if (signup_confirm_password == "") {
      signup_confirm_password_error.textContent = "* Confirm Password Required";
      signup_confirm_password_error.style.color = "red";
    }
    else if (signup_confirm_password.length < 6) {
      signup_confirm_password_error.textContent = "* Confirm Password must be 6 characters long";
      signup_confirm_password_error.style.color = "red";
    }
    else if (signup_confirm_password != "" && signup_confirm_password.length >= 6 && signup_password === signup_confirm_password) {
      signup_confirm_password_error.textContent = "";
      signup_confirm_password_error.style.color = "red";
    }
    else if (signup_password != signup_confirm_password) {
      signup_confirm_password_error.textContent = "* Password and confirm Password must be match";
      signup_confirm_password_error.style.color = "red";
    }
    if ( signup_email_error.textContent == "" && signup_password_error.textContent == "" && signup_confirm_password_error.textContent == "" && username_error.textContent == "" &&  signup_fullname_error.textContent == "" ) {
          return true;
    }
    else {
          return false;
    }
  });
  $("#signup_edit_submit").on("click", function () {
    const signup_username = document.getElementById("username-signup").value;
    let signup_username_error = document.getElementById("signup_username_error");
    const signup_fullname = document.getElementById("fullname-signup").value;
    let signup_fullname_error = document.getElementById("signup_fullname_error");
    const signup_email = document.getElementById("email-signup").value;
    let signup_email_error = document.getElementById("signup_email_error");
    const signup_password = document.getElementById("password-signup").value;
    let signup_password_error = document.getElementById("signup_password_error");
    const signup_confirm_password = document.getElementById("password-confirm-signup").value;
    let signup_confirm_password_error = document.getElementById("signup_confirm_password_error");
    const signup_current_password = document.getElementById("password-current-signup").value;
    let signup_current_password_error = document.getElementById("signup_current_password_error");
    var letters = /^[A-Za-z ]+$/;

    if (signup_email == "") {
      signup_email_error.textContent = "* Email Required";
      signup_email_error.style.color = "red";
    }
    else if (signup_email != "") {
      signup_email_error.textContent = "";
    }
    if (signup_username == "") {
      signup_username_error.textContent = "* Username Required";
      signup_username_error.style.color = "red";
    }
    else if(signup_username.length < 3 || signup_username.length > 24){
      signup_username_error.textContent = "* Username length must be 3-24 characters";
      signup_username_error.style.color = "red";
    }
    else if (signup_username != "") {
      signup_username_error.textContent = "";
    }
    if (signup_fullname == "") {
      signup_fullname_error.textContent = "* Fullname Required";
      signup_fullname_error.style.color = "red";
    }
    else if(signup_fullname.length < 3 || signup_fullname.length > 24){
      signup_fullname_error.textContent = "* Fullname length must be 3-24 characters";
      signup_fullname_error.style.color = "red";
    }
    else if (!signup_fullname.match(letters)){
      signup_fullname_error.textContent = "* Fullname should only contain letters";
      signup_fullname_error.style.color = "red";
    }
    else if (signup_fullname != "") {
      signup_fullname_error.textContent = "";
    }

    if (signup_password.value=='' && signup_password.length < 6) {
      signup_password_error.textContent = "* Password must be 6 characters long";
      signup_password_error.style.color = "red";
    } else if (signup_password.length >= 6) {
      signup_password_error.textContent = ""
    }
    if (signup_password.value=='' && signup_confirm_password.length < 6) {
      signup_confirm_password_error.textContent = "* Confirm Password must be 6 characters long";
      signup_confirm_password_error.style.color = "red";
    }
    else if (signup_confirm_password != "" && signup_confirm_password.length >= 6 && signup_password === signup_confirm_password) {
      signup_confirm_password_error.textContent = "";
      signup_confirm_password_error.style.color = "red";
    }
    else if (signup_password != signup_confirm_password) {
      signup_confirm_password_error.textContent = "* Password and confirm password must be match";
      signup_confirm_password_error.style.color = "red";
    }
    if (signup_current_password == "") {
      signup_current_password_error.textContent = "* Current Password Required";
      signup_current_password_error.style.color = "red";
    }
    else if (signup_current_password.length < 6) {
      signup_current_password_error.textContent = "* Current Password must be 6 characters long";
      signup_current_password_error.style.color = "red";
    }
    else if (signup_current_password != "" && signup_current_password.length >= 6 ) {
      signup_current_password_error.textContent = "";
      signup_current_password_error.style.color = "red";
    }
    else if (signup_password != signup_current_password) {
      signup_current_password_error.textContent = "* Password and current Password must be match";
      signup_current_password_error.style.color = "red";
    }
    if ( signup_email_error.textContent == "" && signup_password_error.textContent == "" && signup_current_password_error.textContent == "" && signup_confirm_password_error.textContent == "" && username_error.textContent == "" &&  signup_fullname_error.textContent == "" ) {
          return true;
    }
    else {
          return false;
    }
  });
});
