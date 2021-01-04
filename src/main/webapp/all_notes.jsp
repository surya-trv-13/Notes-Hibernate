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
		<%
			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			Query query = s.createQuery("from Notes");
			List<Notes> list = query.list();
			
			for(Notes note: list){
				out.println(note.getId()+":"+note.getTitle()+":"+note.getContent()+"<br>");
			}
			
			tx.commit();
			s.close();
		%>
	</div>
</body>
</html>