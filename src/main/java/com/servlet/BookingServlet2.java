package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.db.DBConnection;

@WebServlet("/BookingServlet2")
public class BookingServlet2 extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // GET FORM DATA
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String service = request.getParameter("service");
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        // SESSION USER
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO bookings(username, first_name, last_name, service, booking_date, time_slot, phone) VALUES (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, username);
            ps.setString(2, firstName);
            ps.setString(3, lastName);
            ps.setString(4, service);
            ps.setString(5, date);
            ps.setString(6, time);
            ps.setString(7, phone);

            int i = ps.executeUpdate();

            if (i > 0) {
                response.sendRedirect("book.jsp?status=success");
            } else {
                response.sendRedirect("book.jsp?status=fail");
            }

        } catch (Exception e) {
            e.printStackTrace();

            response.setContentType("text/html");
            response.getWriter().println("<h2 style='color:red;'>Error: " + e.getMessage() + "</h2>");
        }
    }
}