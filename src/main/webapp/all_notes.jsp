<%@page import="com.entities.Notes"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_js_css.jsp"%>
<title>All Notes: Notes Taker</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<h3 class="text-uppercase">All Notes:</h3>
		<div class="row">
			<div class="col-12">
				<%
					Session s = FactoryProvider.getFactory().openSession();
				Transaction tx = s.beginTransaction();
				
				List<Notes> list = s.createQuery("from Notes").getResultList();

				for (Notes note : list) {
				%>
				<div class="card mt-3">
					<img class="card-img-top m-4 mx-auto" style="max-width:100px" src="image/notes.png"
						alt="Card image cap">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text"><%=note.getContent()%></p>
						<p class="card-text"><b class="text-danger">Last Updated: <%=note.getAddedDate()%></b></p>
						<div class="container text-center mt-2">
							<a href="DeleteNoteServlet?noteId=<%= note.getId() %>" class="btn btn-danger">Delete</a> 
							<a href="update.jsp?noteId=<%= note.getId() %>" class="btn btn-success">Update</a>
						</div>
					</div>
				</div>
				<%
					}

				tx.commit();
				s.close();
				%>
			</div>
		</div>

	</div>
</body>
</html>