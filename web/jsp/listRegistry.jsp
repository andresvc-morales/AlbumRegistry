<%-- 
    Document     : listRegistry.jsp
    Description  : Displays a grid of album cards showing album information.
                  Each card includes the album cover, name, author, and stock.
                  Also contains modals for editing and deleting albums.
                  This JSP is included in the main index page.
    Created on   : Oct 25, 2025, 8:58:05 PM
    Author       : andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, pack.model.Album, pack.connection.DBConnection" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%-- Album Cards Grid Section --%>
        <section id="cards_section">
            <div class="container mt-5">
                <div class="row g-4"> 
                    <%
                        // Retrieve all albums from the database
                        DBConnection db = new DBConnection();
                        List<Album> albums = db.getAlbumInfo();

                        // Iterate through albums and create cards
                        for(Album album : albums) {
                    %>
                    <div class="col-md-4"> 
                        <div class="card position-relative">
                            <div class="d-flex flex-column position-absolute top-0 end-0 m-2 gap-2">
                                <button class="btn btn-primary rounded-circle d-flex align-items-center justify-content-center" style="width: 45px; height: 45px;" data-bs-toggle="modal" data-bs-target="#editModal<%= album.getId() %>" title="edit">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" viewBox="0 0 16 16">
                                        <path d="M11.293 1.293a1 1 0 0 1 1.414 0l2 2a1 1 0 0 1 0 1.414l-9 9a1 1 0 0 1-.39.242l-3 1a1 1 0 0 1-1.266-1.265l1-3a1 1 0 0 1 .242-.391l9-9ZM12 2.5l1.5 1.5-8.5 8.5-1.5.5.5-1.5L12 2.5Z"/>
                                    </svg>
                                </button>

                                <button type="button" class="btn btn-danger rounded-circle d-flex align-items-center justify-content-center" style="width:45px; height:45px;" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal<%= album.getId() %>" title="delete">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" viewBox="0 0 16 16">
                                        <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                                    </svg>
                                </button>
                            </div>

                            <img src="<%= album.getAlbumCoverPath() %>" class="card-img-top" alt="<%= album.getAlbumName() %>">

                            <div class="card-body position-relative">
                                <h5 class="card-title"><%= album.getAlbumName() %></h5>
                                <p class="card-text"><%= album.getAlbumAuthor() %></p>
                                <span class="position-absolute bottom-0 end-0 m-2 badge bg-secondary">
                                    <%= album.getAlbumStock() %>
                                </span>
                            </div>
                        </div>
                    </div>
                    


                    <%-- Edit Album Modal --%>
                    <div class="modal fade" id="editModal<%= album.getId() %>" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="jsp/editRegistry.jsp" method="post">
                                    <input type="hidden" name="id" value="<%= album.getId() %>">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Edit Album</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <label for="albumNameInput<%= album.getId() %>" class="form-label">Album Name</label>
                                            <input class="form-control" type="text" id="albumNameInput<%= album.getId() %>" name="albumNameInput" value="<%= album.getAlbumName() %>" placeholder="Write the album name" required>
                                        </div>
                                        
                                        <div class="mb-3">
                                            <label for="albumAuthorInput<%= album.getId() %>" class="form-label">Album Author</label>
                                            <input class="form-control" type="text" id="albumAuthorInput<%= album.getId() %>" name="albumAuthorInput" value="<%= album.getAlbumAuthor() %>" placeholder="Write the album author" required>
                                        </div>
                                        
                                        <div class="mb-3">
                                            <label for="albumStockInput<%= album.getId() %>" class="form-label">Album Stock</label>
                                            <input class="form-control" type="number" id="albumStockInput<%= album.getId() %>" name="albumStockInput" value="<%= album.getAlbumStock() %>" placeholder="Write the album stock" required>
                                        </div>
                                        
                                        <div class="mb-3">
                                            <label for="albumCoverInput<%= album.getId() %>" class="form-label">Album Image</label>
                                            <input class="form-control" type="url" id="albumCoverInput<%= album.getId() %>" name="albumCoverInput" value="<%= album.getAlbumCoverPath() %>" placeholder="https://example.com/cover.png">
                                        </div>
                                    </div>
                                    
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                        <button type="submit" class="btn btn-primary">Update Album</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>


                    <%-- Delete Confirmation Modal --%>
                    <div class="modal fade" id="confirmDeleteModal<%= album.getId() %>" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Confirm Delete Album</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body">
                                    Are you sure you want to delete"<%= album.getAlbumName() %>"?
                                </div>
                                <div class="modal-footer">
                                    <form action="jsp/deleteRegistry.jsp" method="post">
                                        <input type="hidden" name="id" value="<%= album.getId() %>">
                                        <button type="submit" class="btn btn-danger">Yes</button>
                                    </form>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <% } %>
                </div>
            </div>
        </section>
    </body>
</html>