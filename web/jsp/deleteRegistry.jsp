<%-- 
    Document     : deleteRegistry.jsp
    Description  : Handles the deletion of album records from the database.
                  Processes delete requests from the confirmation modal
                  and redirects back to the index page after deletion.
    Created on   : Oct 25, 2025, 9:00:34 PM
    Author       : andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="pack.connection.DBConnection"%>
<!DOCTYPE html>
<%
    // Get the ID of the album to delete
    String cardId = request.getParameter("id");
    // Process deletion if an ID was provided
    if(cardId != null) {
        int id = Integer.parseInt(cardId);
        DBConnection db = new DBConnection();
        db.deleteAlbum(id);
    }

    // Redirect back to the main page
    response.sendRedirect("../index.jsp");
%>
    
