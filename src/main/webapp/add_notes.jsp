<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_js_css.jsp"%>
<title>Add Notes: Home Page</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<h3>Add notes here...</h3>

		<!-- This is add form -->
		<form method="post" action="AddNoteServlet">
			<div class="mb-3">
				<label for="title" class="form-label"> Notes Title </label> 
				<input
					name="title"
					type="text" class="form-control" id="title"
					placeholder="Enter Here..."
					required>
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Notes Content</label>
				<textarea
					name="content" 
					id="content" 
					class="form-control textarea" 
					placeholder="Enter your Note content here..."
					required></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn orange">Add</button>
			</div>
		</form>
	</div>
</body>
</html>