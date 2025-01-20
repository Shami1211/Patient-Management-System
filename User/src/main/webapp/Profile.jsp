<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>User Profile Details</title>
    <link rel="stylesheet" href="CSS/detail.css" />
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f9f9f9;
      }

      .container {
        max-width: 800px;
        margin: 20px auto;
        background: #fff;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
      }

      h1, h2 {
        color: #333;
        text-align: center;
      }

      .details-section {
        margin: 20px 0;
        border-top: 1px solid #ddd;
        padding-top: 15px;
      }

      .details-section:first-of-type {
        border-top: none;
        padding-top: 0;
      }

      .detail-item {
        display: flex;
        justify-content: space-between;
        padding: 10px 0;
        border-bottom: 1px solid #f1f1f1;
      }

      .detail-item:last-child {
        border-bottom: none;
      }

      .detail-label {
        font-weight: bold;
        color: #555;
      }

      .detail-value {
        color: #444;
      }

      .form-actions {
        text-align: center;
        margin-top: 20px;
      }

      .form-actions a button {
        background-color: #6A80B9;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 14px;
        cursor: pointer;
        border-radius: 4px;
        margin: 5px;
        transition: background-color 0.3s ease;
      }

      .form-actions a button.delete {
        background-color: #f44336;
      }

      .form-actions a button:hover {
        opacity: 0.9;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h1>User Profile Details</h1>

      <c:forEach var="cus" items="${cusDetails}">
        <!-- Account Details Section -->
        <div class="details-section">
          <h2>Account Details</h2>
          <div class="detail-item">
            <div class="detail-label">ID:</div>
            <div class="detail-value">${cus.id}</div>
          </div>
          <div class="detail-item">
            <div class="detail-label">Username:</div>
            <div class="detail-value">${cus.username}</div>
          </div>
          <div class="detail-item">
            <div class="detail-label">Email:</div>
            <div class="detail-value">${cus.email}</div>
          </div>
          <div class="detail-item">
            <div class="detail-label">Password:</div>
            <div class="detail-value">********</div>
          </div>
        </div>

        <!-- Patient Details Section -->
        <div class="details-section">
          <h2>Patient Details</h2>
          <div class="detail-item">
            <div class="detail-label">Name:</div>
            <div class="detail-value">${cus.patientName}</div>
          </div>
          <div class="detail-item">
            <div class="detail-label">Age:</div>
            <div class="detail-value">${cus.patientAge}</div>
          </div>
          <div class="detail-item">
            <div class="detail-label">Gender:</div>
            <div class="detail-value">${cus.patientGender}</div>
          </div>
          <div class="detail-item">
            <div class="detail-label">Condition:</div>
            <div class="detail-value">${cus.patientCondition}</div>
          </div>
        </div>

        <!-- Guardian Details Section -->
        <div class="details-section">
          <h2>Guardian Details</h2>
          <div class="detail-item">
            <div class="detail-label">Name:</div>
            <div class="detail-value">${cus.guardianName}</div>
          </div>
          <div class="detail-item">
            <div class="detail-label">Contact:</div>
            <div class="detail-value">${cus.guardianContact}</div>
          </div>
          <div class="detail-item">
            <div class="detail-label">Relation:</div>
            <div class="detail-value">${cus.guardianRelation}</div>
          </div>
        </div>

        <!-- Action Buttons -->
        <div class="form-actions">
          <c:url value="Update.jsp" var="cusupdate">
            <c:param name="id" value="${cus.id}" />
            <c:param name="username" value="${cus.username}" />
            <c:param name="email" value="${cus.email}" />
            <c:param name="password" value="${cus.password}" />
            <c:param name="patientName" value="${cus.patientName}" />
            <c:param name="patientAge" value="${cus.patientAge}" />
            <c:param name="patientGender" value="${cus.patientGender}" />
            <c:param name="patientCondition" value="${cus.patientCondition}" />
            <c:param name="guardianName" value="${cus.guardianName}" />
            <c:param name="guardianContact" value="${cus.guardianContact}" />
            <c:param name="guardianRelation" value="${cus.guardianRelation}" />
          </c:url>
          <c:url value="Delete.jsp" var="cusdelete">
            <c:param name="id" value="${cus.id}" />
          </c:url>
          <a href="${cusupdate}"><button>Update Profile</button></a>
          <a href="${cusdelete}"><button class="delete">Delete Account</button></a>
        </div>
      </c:forEach>
    </div>
  </body>
</html>
