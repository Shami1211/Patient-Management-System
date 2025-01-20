package com.user;



import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String id = request.getParameter("cusid");
	    String name = request.getParameter("uname");
	    String email = request.getParameter("email");
	    String password = request.getParameter("pass");

	    // Patient Details
	    String patientName = request.getParameter("patientName");
	    String patientAge = request.getParameter("patientAge");
	    String patientGender = request.getParameter("patientGender");
	    String patientCondition = request.getParameter("patientCondition");

	    // Guardian Details
	    String guardianName = request.getParameter("guardianName");
	    String guardianContact = request.getParameter("guardianContact");
	    String guardianRelation = request.getParameter("guardianRelation");

	    boolean isTrue = UserDBUtil.updatecustomer(id, name, email, password, patientName, patientAge, patientGender,
	                                               patientCondition, guardianName, guardianContact, guardianRelation);

	    if (isTrue) {
	        List<User> cusDetails = UserDBUtil.getCustomerDetails(id);
	        request.setAttribute("cusDetails", cusDetails);

	        RequestDispatcher dis = request.getRequestDispatcher("Profile.jsp");
	        dis.forward(request, response);
	    } else {
	        List<User> cusDetails = UserDBUtil.getCustomerDetails(id);
	        request.setAttribute("cusDetails", cusDetails);

	        RequestDispatcher dis = request.getRequestDispatcher("Profile.jsp");
	        dis.forward(request, response);
	    }
	}


}
