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
import com.google.appengine.api.datastore.PropertyContainer;


public class LoginpageServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		String emailaddress = req.getParameter("emailaddress");
		String loginpassword= req.getParameter("loginpassword");
		String login ="";
		String pass= "";
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();


	        	Key k1 = KeyFactory.createKey("customerlist", emailaddress);
	    		Entity customerlist;
	    		try {
	    			customerlist = ds.get(k1);
	    			pass= (String) customerlist.getProperty("Password");
	    			System.out.println(pass);
	    			System.out.println(loginpassword);

	    		} 
	    		catch (EntityNotFoundException e)
	    		{
	    			System.out.println(e);
	    			login = "1";
					System.out.println("Sorry you have to create your account");
					
	    		}
	    	//	catch (EntityNotFoundException e) {
	    			
	    			
	    			//e.printStackTrace();
	    		//}
	        	if(login == "1"){
	        		String msg= "<p style=\"color: red;\">You have not registered yet</p>";
		        	RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
		        	req.setAttribute("name", msg);
		        	dispatcher.forward( req, resp );
	        	}
	        	else{
	        	
	        	if(pass.equals(loginpassword)){
	 	        RequestDispatcher dispatcher = req.getRequestDispatcher("todo.html");
	 				dispatcher.forward( req, resp );

	        	 }
	        	else{
	        	RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
	        	dispatcher.forward( req, resp );
	        	}
	        	}
	}
}