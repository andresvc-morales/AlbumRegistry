<%-- 
    Document     : createRegistry.jsp
    Description  : Handles the creation of new album records in the database.
                  Processes form submissions from the main page's add album modal.
                  Performs input validation and redirects back to the index page
                  after successful creation.
    Created on   : Oct 25, 2025, 8:57:42 PM
    Author       : andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="pack.connection.DBConnection"%>

<%
    // Retrieve form parameters
    String albumName = request.getParameter("albumNameInput");
    String albumAuthor = request.getParameter("albumAuthorInput");
    String albumCover = request.getParameter("albumCoverInput");
    Integer albumStock = Integer.parseInt(request.getParameter("albumStockInput"));

    // Validate required fields
    if (albumName == null || albumName.trim().isEmpty() ||
        albumAuthor == null || albumAuthor.trim().isEmpty() ||
        albumCover == null || albumCover.trim().isEmpty()) {
        out.println("Error: All fields are required");
        return;
    }
    
    // Create database connection and insert new album
    DBConnection db = new DBConnection();
    int insertionId = db.insertNewAlbum(albumName, albumAuthor, albumCover, albumStock);

    // Redirect back to the main page
    response.sendRedirect("../index.jsp");
%> 
   