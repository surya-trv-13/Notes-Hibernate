package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Notes;
import com.helper.FactoryProvider;

public class AddNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Notes note = new Notes(title, content, new Date());
			//hibernate Save
			Session session = FactoryProvider.getFactory().openSession();
			Transaction transaction = session.beginTransaction();
			
			session.save(note);
			
			transaction.commit();
			session.close();
			
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h2>Added notes successfully</h2>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
