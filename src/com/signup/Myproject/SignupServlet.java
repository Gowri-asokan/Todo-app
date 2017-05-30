package com.signup.Myproject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

@SuppressWarnings("serial")
public class SignupServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		String user = req.getParameter("username");
		String email = req.getParameter("email");
		String password= req.getParameter("password");
		String login ="";
		
		System.out.println("username" + user);
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		
		Entity e = new Entity("customerlist", email);
	    e.setProperty("username", user);
		//e.setProperty("Email", email);
		e.setProperty("Password", password);
		
        
        try {

        	Key k1 = KeyFactory.createKey("customerlist", email);
        	ds.get(k1);
        	System.out.println("Your account already exist");
        	login = "1";
        }
        catch(EntityNotFoundException excep)
        {
        	ds.put(e);
			System.out.println("you have signup successfully");
        }
        catch (Exception error) 
        {
			error.printStackTrace();
		
        }
        
        if(login == "1"){
        	RequestDispatcher dispatcher = req.getRequestDispatcher("signup.html");
        	dispatcher.forward( req, resp );
        }
        else{
		//resp.setContentType("text/plain");
		//resp.getWriter().println("username : "+ user +" "+ "email : "+ email +" "+ "password : " + password);
		RequestDispatcher dispatcher = req.getRequestDispatcher("todo.html");
    	dispatcher.forward( req, resp );
        }
		
	}
}
