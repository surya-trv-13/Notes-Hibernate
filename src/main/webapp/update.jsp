<%@page import="com.entities.Notes"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_js_css.jsp"%>
<title>Update : Notes Taker</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<h3>Update the Note</h3>
		<%
			int noteId = Integer.parseInt(request.getParameter("noteId").trim());
			Session ses = FactoryProvider.getFactory().openSession();
			Notes note = (Notes)ses.get(Notes.class, noteId);
		%>
		<form method="post" action="UpdateNoteServlet">
			<div class="mb-3">
				<label for="title" class="form-label"> Notes Title </label>
				<input value="<%=note.getId()%>" name="noteId" type="hidden"> 
				<input
					name="title"
					type="text" class="form-control" id="title"
					placeholder="Enter Here..."
					autocomplete="off"
					value=<%= note.getTitle() %> 
					required>
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Notes Content</label>
				<textarea
					name="content" 
					id="content" 
					class="form-control textarea" 
					placeholder="Enter your Note content here..."
					autocomplete="off"
					required><%= note.getContent().trim() %>
					</textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn orange">Update</button>
			</div>
		</form>
	</div>
</body>
</html>