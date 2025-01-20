<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login Page</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    <style>
      body {
        background-color: #E8F9FF;
        font-family: Arial, sans-serif;
      }
       .container0 {
    padding: 90px;
    }
      .container {
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-width: 450px;
        width: 100%;
        animation: fadeIn 0.5s ease-in-out;
      }
      @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
      }
      h1 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
      }
      .form-group {
        margin-bottom: 15px;
      }
      label {
        font-weight: bold;
        display: block;
        margin-bottom: 5px;
      }
      input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
      }
      .password-wrapper {
        position: relative;
        display: flex;
        align-items: center;
      }
      .password-wrapper input {
        padding-right: 40px;
      }
      .toggle-password {
        position: absolute;
        right: 10px;
        cursor: pointer;
        color: #6A80B9;
        font-size: 20px;
      }
      button {
        background-color: #6A80B9;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        font-weight: bold;
        width: 100%;
        margin-top: 20px;
      }
      button:hover {
        background-color: #5A70A9;
      }
      p {
        text-align: center;
        margin-top: 10px;
      }
      a {
        color: #6A80B9;
        text-decoration: none;
        font-weight: bold;
      }
      a:hover {
        text-decoration: underline;
      }
    </style>
  </head>
  <body>
  <div class="container0">
    <div class="container">
      <h1>Login Here</h1>
      <form action="login" method="post">
        <div class="form-group">
          <label for="username">Username</label>
          <input type="text" id="username" name="username" placeholder="Enter your username" required />
        </div>
        <div class="form-group password-field">
          <label for="password">Password</label>
          <div class="password-wrapper">
            <input type="password" id="password" name="password" placeholder="Enter your password" required />
            <span class="toggle-password">
              <i class="fa fa-eye" id="togglePassword"></i>
            </span>
          </div>
        </div>
        <button type="submit">Login</button>
      </form>
      <p>
        Don't have an account? 
        <a href="http://localhost:8090/User/Register.jsp">Register here</a>
      </p>
    </div>
    </div>
    <script>
      // Toggle password visibility
      const togglePassword = document.getElementById('togglePassword');
      const passwordInput = document.getElementById('password');

      togglePassword.addEventListener('click', () => {
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);
        togglePassword.classList.toggle('fa-eye');
        togglePassword.classList.toggle('fa-eye-slash');
      });
    </script>
  </body>
</html>
