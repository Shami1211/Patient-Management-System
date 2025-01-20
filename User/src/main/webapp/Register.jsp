<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Multi-Step Form</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
  <style>
    body {
      background-color: #E8F9FF;
      font-family: Arial, sans-serif;
    }
     .container0 {
    padding: 60px;
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
    h1, h2 {
      text-align: center;
      color: #333;
    }
    .form-step {
      display: none;
    }
    .form-step.active {
      display: block;
    }
    .form-group {
      margin-bottom: 15px;
    }
    label {
      font-weight: bold;
      display: block;
    }
    input, select {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
      margin-top: 5px;
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
    .button-group {
      display: flex;
      justify-content: space-between;
    }
    .button-group button {
      width: 48%;
    }
    .error-message {
      color: red;
      font-size: 14px;
      margin-top: 5px;
    }
  </style>
</head>
<body>
<div class="container0">
  <div class="container">
    <h1>Patient Form</h1>
    <form id="multiStepForm" action="insert" method="post">
      <!-- User Details -->
      <div class="form-step active" id="userDetails">
        <h2>Account Details</h2>
        <div class="form-group">
          <label for="username">Username</label>
          <input type="text" id="username" name="uid" required />
        </div>
        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" id="email" name="email" required />
        </div>
        <div class="form-group password-field">
          <label for="password">Password</label>
          <div class="password-wrapper">
            <input type="password" id="password" name="psw" required />
            <span class="toggle-password">
              <i class="fa fa-eye" id="togglePassword"></i>
            </span>
          </div>
        </div>
        <button type="button" onclick="nextStep()">Next</button>
      </div>

      <!-- Patient Details -->
      <div class="form-step" id="patientDetails">
        <h2>Patient Details</h2>
        <div class="form-group">
          <label for="patientName">Patient Name</label>
          <input type="text" id="patientName" name="patientName" required />
        </div>
        <div class="form-group">
          <label for="patientAge">Patient Age</label>
          <input type="number" id="patientAge" name="patientAge" required />
        </div>
                <div class="form-group">
          <label for="patientAge">Patient Condition</label>
          <input type="text" id="patientCondition" name="patientCondition" required />
        </div>
        <div class="form-group">
          <label for="patientGender">Patient Gender</label>
          <select id="patientGender" name="patientGender" required>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
          </select>
        </div>
        <div class="button-group">
          <button type="button" onclick="prevStep()">Previous</button>
          <button type="button" onclick="nextStep()">Next</button>
        </div>
      </div>

      <!-- Guardian Details -->
      <div class="form-step" id="guardianDetails">
        <h2>Guardian Details</h2>
        <div class="form-group">
          <label for="guardianName">Guardian Name</label>
          <input type="text" id="guardianName" name="guardianName" required />
        </div>
        <div class="form-group">
          <label for="guardianContact">Guardian Contact</label>
          <input type="text" id="guardianContact" name="guardianContact" required />
          <div class="error-message" id="phoneError"></div>
        </div>
        <div class="form-group">
          <label for="guardianRelation">Guardian Relation</label>
          <input type="text" id="guardianRelation" name="guardianRelation" required />
        </div>
        <div class="button-group">
          <button type="button" onclick="prevStep()">Previous</button>
          <button type="submit" onclick="validateForm(event)">Submit</button>
        </div>
      </div>
    </form>
  </div>
   </div>

  <script>
    let currentStep = 0;
    const steps = document.querySelectorAll('.form-step');

    function showStep(index) {
      steps.forEach((step, i) => {
        step.classList.toggle('active', i === index);
      });
    }

    function nextStep() {
      if (currentStep < steps.length - 1) {
        currentStep++;
        showStep(currentStep);
      }
    }

    function prevStep() {
      if (currentStep > 0) {
        currentStep--;
        showStep(currentStep);
      }
    }

    // Toggle password visibility
    const togglePassword = document.getElementById('togglePassword');
    const passwordInput = document.getElementById('password');

    togglePassword.addEventListener('click', () => {
      const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
      passwordInput.setAttribute('type', type);
      togglePassword.classList.toggle('fa-eye');
      togglePassword.classList.toggle('fa-eye-slash');
    });

    // Validate Sri Lankan phone number
    function validateForm(event) {
      const phoneInput = document.getElementById('guardianContact');
      const phoneError = document.getElementById('phoneError');
      const phoneRegex = /^\+94\d{9}$/;

      if (!phoneRegex.test(phoneInput.value)) {
        phoneError.textContent = 'Please enter a valid Sri Lankan phone number (+94XXXXXXXXX).';
        event.preventDefault();
      } else {
        phoneError.textContent = '';
      }
    }
  </script>
</body>
</html>
