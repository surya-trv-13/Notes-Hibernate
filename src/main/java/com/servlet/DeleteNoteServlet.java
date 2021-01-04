package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Notes;
import com.helper.FactoryProvider;


public class DeleteNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeleteNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noteId = Integer.parseInt(request.getParameter("noteId").trim());
		Session session = FactoryProvider.getFactory().openSession();
		Transaction transac = session.beginTransaction();
		
		Notes note = (Notes)session.load(Notes.class, noteId);
		session.delete(note);
		
		transac.commit();
		session.close();
		
		response.sendRedirect("all_notes.jsp");
	}
}
