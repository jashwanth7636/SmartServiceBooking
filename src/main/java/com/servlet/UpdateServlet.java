package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.db.DBConnection;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String service = request.getParameter("service");
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        try {
            Connection con = DBConnection.getConnection();

            String query = "UPDATE bookings SET service=?, booking_date=?, time_slot=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, service);
            ps.setString(2, date);
            ps.setString(3, time);
            ps.setInt(4, id);

            ps.executeUpdate();

            response.sendRedirect("viewBookings.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}