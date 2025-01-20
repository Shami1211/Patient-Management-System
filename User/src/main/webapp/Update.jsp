<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edit Profile Page</title>
    <link rel="stylesheet" href="CSS/detail.css" />
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
      }

      .container {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        background: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
      }

      h1 {
        text-align: center;
        color: #333;
      }

      .form-group {
        margin-bottom: 15px;
      }

      .form-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #555;
      }

      .form-group input {
        width: 100%;
        padding: 10px;
        font-size: 14px;
        border: 1px solid #ddd;
        border-radius: 4px;
      }

      .form-group .password-wrapper {
        position: relative;
      }

      .form-group .password-wrapper input {
        padding-right: 40px;
      }

      .form-group .toggle-icon {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
        font-size: 16px;
        color: #007bff;
      }

      button[type="submit"] {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        background-color: #6A80B9;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
      }

      button[type="submit"]:hover {
        background-color: #45a049;
      }
    </style>
  </head>
  <body>
  
  <%-- Retrieving parameters for user details --%>
  <%
    String id = request.getParameter("id");
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String patientName = request.getParameter("patientName");
    String patientAge = request.getParameter("patientAge");
    String patientGender = request.getParameter("patientGender");
    String patientCondition = request.getParameter("patientCondition");
    String guardianName = request.getParameter("guardianName");
    String guardianContact = request.getParameter("guardianContact");
    String guardianRelation = request.getParameter("guardianRelation");
  %>

    <div class="container">
      <h1>Update Account Details</h1>

      <form action="UpdateCustomerServlet" method="post">

        <%-- User Details --%>
        <div class="form-group">
          <label for="cusid">User ID</label>
          <input type="text" id="cusid" name="cusid" value="<%= id %>" readonly />
        </div>
        <div class="form-group">
          <label for="username">User Name</label>
          <input type="text" id="username" name="uname" value="<%= username %>" />
        </div>
        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" id="email" name="email" value="<%= email %>" />
        </div>
        <div class="form-group password-wrapper">
          <label for="password">Password</label>
          <input type="password" id="password" name="pass" value="<%= password %>" />
          <i id="togglePassword" class="toggle-icon">👁️</i>
        </div>

        <%-- Patient Details --%>
        <div class="form-group">
          <label for="patientName">Patient Name</label>
          <input type="text" id="patientName" name="patientName" value="<%= patientName %>" />
        </div>
        <div class="form-group">
          <label for="patientAge">Patient Age</label>
          <input type="text" id="patientAge" name="patientAge" value="<%= patientAge %>" />
        </div>
        <div class="form-group">
          <label for="patientGender">Patient Gender</label>
          <input type="text" id="patientGender" name="patientGender" value="<%= patientGender %>" />
        </div>
        <div class="form-group">
          <label for="patientCondition">Patient Condition</label>
          <input type="text" id="patientCondition" name="patientCondition" value="<%= patientCondition %>" />
        </div>

        <%-- Guardian Details --%>
        <div class="form-group">
          <label for="guardianName">Guardian Name</label>
          <input type="text" id="guardianName" name="guardianName" value="<%= guardianName %>" />
        </div>
        <div class="form-group">
          <label for="guardianContact">Guardian Contact</label>
          <input type="text" id="guardianContact" name="guardianContact" value="<%= guardianContact %>" />
        </div>
        <div class="form-group">
          <label for="guardianRelation">Guardian Relation</label>
          <input type="text" id="guardianRelation" name="guardianRelation" value="<%= guardianRelation %>" />
        </div>

        <button type="submit">UPDATE</button>
      </form>
    </div>

    <script>
      // Password visibility toggle
      const togglePassword = document.getElementById('togglePassword');
      const passwordField = document.getElementById('password');

      togglePassword.addEventListener('click', () => {
        const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordField.setAttribute('type', type);
        togglePassword.textContent = type === 'password' ? '👁️' : '🙈';
      });
    </script>
  </body>
</html>
