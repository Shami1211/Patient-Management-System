package com.user;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CustomerInsert")
public class CustomerInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Retrieving parameters from the request
        String username = request.getParameter("uid");
        String email = request.getParameter("email");
        String password = request.getParameter("psw");
        String patientName = request.getParameter("patientName");
        String patientAge = request.getParameter("patientAge");
        String patientGender = request.getParameter("patientGender");
        String patientCondition = request.getParameter("patientCondition");
        String guardianName = request.getParameter("guardianName");
        String guardianContact = request.getParameter("guardianContact");
        String guardianRelation = request.getParameter("guardianRelation");

        boolean isTrue;

        // Passing parameters to the insert method in UserDBUtil
        isTrue = UserDBUtil.insertcustomer(username, email, password, patientName, patientAge, patientGender, patientCondition, guardianName, guardianContact, guardianRelation);

        // Forwarding to the appropriate JSP based on the success of the operation
        if (isTrue) {
            RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
            dis.forward(request, response);
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
            dis2.forward(request, response);
        }
    }
}
