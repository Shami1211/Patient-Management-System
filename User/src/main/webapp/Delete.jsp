<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Delete Account Confirmation</title>
	<link href="CSS/detail.css" rel="stylesheet">

	<script type="text/javascript">
		// JavaScript function for confirmation dialog
		function confirmDelete() {
			var confirmation = confirm("Are you sure you want to delete this account?");
			if (confirmation) {
				// If confirmed, submit the form
				document.getElementById("deleteForm").submit();
			} else {
				// If canceled, do nothing
				return false;
			}
		}
	</script>
</head>
<body>

	<%
		String id = request.getParameter("id");
	%>
	
	<div class="container">
		<h1>Account Delete Confirmation</h1>

		<!-- Form to submit deletion request -->
		<form id="deleteForm" action="delete" method="post">
			<div class="form-group">
				<label for="id">ID</label>
				<input type="text" name="cusid" value="<%= id %>" readonly/>
			</div><br>
			
			<!-- Button to trigger confirmation dialog -->
			<button type="button" class="dlt" onclick="confirmDelete()">Delete Account</button><br><br>
		</form>
	</div>

</body>
</html>
