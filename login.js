function checkLogin(){
    // Hardcoded values
    const validUsername = "user1";
    const validPassword = "testpass";

    //Get values from fields
    const username = document.getElementById("username").value;
    const pass = document.getElementById("pass").value;

    //Check credentials
    if (username === validUsername && pass === validPassword) {
        alert("Login Successful!");
    } else{
        alert("Invalid username or password.");
    }
}

