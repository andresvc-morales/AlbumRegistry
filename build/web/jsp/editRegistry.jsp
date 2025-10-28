<%-- 
    Document     : editRegistry.jsp
    Description  : Handles the updating of existing album records.
                  Processes form submissions from the edit modal dialog
                  and updates the corresponding database record.
                  Validates input data before performing the update.
    Created on   : Oct 25, 2025, 8:59:53 PM
    Author       : andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="pack.connection.DBConnection"%>
<!DOCTYPE html>
<%
    // Retrieve form parameters
    String cardId = request.getParameter("id");
    String albumName = request.getParameter("albumNameInput");
    String albumAuthor = request.getParameter("albumAuthorInput");
    String albumStock = request.getParameter("albumStockInput");
    String albumCover = request.getParameter("albumCoverInput");
    
    // Process update if all required fields are present
    if(cardId != null && albumName != null && albumAuthor != null && albumStock != null) {
        // Convert string values to appropriate types
        int id = Integer.parseInt(cardId);
        int stock = Integer.parseInt(albumStock);
        
        // Update the album record in the database
        DBConnection db = new DBConnection();
        db.editAlbum(id, albumName, albumAuthor, albumCover, stock);
    }

    // Redirect back to the main page
    response.sendRedirect("../index.jsp");
%>