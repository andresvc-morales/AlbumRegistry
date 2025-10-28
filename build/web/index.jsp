<%-- 
    Document     : index.jsp
    Description  : Main page of the Album Registry application.
                  Displays the album list and provides functionality
                  to add, edit, and delete albums.
    Created on   : Oct 25, 2025, 8:55:10 PM
    Author      : andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Album Registry</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- External stylesheets -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%-- Toolbar Section: Contains the page title and add album button --%>
        <section id="toolbar_section">
            <div id="toolbar" class="container-sm px-3 mt-4 px-md-5 mt-md-5">
                <div class="row align-items-center g-2">
                    <h1 id="tb_main_title" class="col">Album registry</h1>
                    <div class="col-auto">
                        <button id="tb_add_button" type="button" class="btn btn-primary rounded-circle d-flex align-items-center justify-content-center" style="width: 45px; height: 45px; min-width: 45px;" data-bs-toggle="modal" data-bs-target="#add_modal">
                            <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" viewBox="0 0 16 16">
                                <path d="M8 3a1 1 0 0 1 1 1v3h3a1 1 0 1 1 0 2h-3v3a1 1 0 1 1-2 0v-3H4a1 1 0 1 1 0-2h3V4a1 1 0 0 1 1-1z"/>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
        </section>
      
        <%-- Albums Display Section: Shows the grid of album cards --%>
        <section id="cards_section">
            <div id="cards_container" class="container-sm px-3 pb-5 mt-4 px-md-5 mt-md-5">
                <%-- Include the album listing component --%>
                <jsp:include page="jsp/listRegistry.jsp" />
            </div>
        </section>        
        
        <%-- Modals Section: Contains the modal dialogs for adding albums --%>
        <section id="modals_section">
            <div  id="add_modal" class="modal fade" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="jsp/createRegistry.jsp" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title" id="modal_label">Album information</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>

                            <div class="modal-body">
                                <%-- Album Name Field --%>
                                <div class="mb-3">
                                    <label for="albumNameInput" class="form-label">Album Name</label>
                                    <input class="form-control" 
                                           type="text" 
                                           id="albumNameInput" 
                                           name="albumNameInput" 
                                           placeholder="Enter the album name" 
                                           required>
                                </div>
                                
                                <%-- Album Author Field --%>
                                <div class="mb-3">
                                    <label for="albumAuthorInput" class="form-label">Album Author</label>
                                    <input class="form-control" 
                                           type="text" 
                                           id="albumAuthorInput" 
                                           name="albumAuthorInput" 
                                           placeholder="Enter the artist or band name" 
                                           required>
                                </div>
                                
                                <%-- Album Stock Field --%>
                                <div class="mb-3">
                                    <label for="albumStockInput" class="form-label">Album Stock</label>
                                    <input class="form-control" 
                                           type="number" 
                                           id="albumStockInput" 
                                           name="albumStockInput" 
                                           placeholder="Enter the number of copies" 
                                           min="0"
                                           required>
                                </div>
                                
                                <%-- Album Cover Image Field --%>
                                <div class="mb-3">
                                    <label for="albumCoverInput" class="form-label">Album Cover URL</label>
                                    <input class="form-control" 
                                           type="url" 
                                           id="albumCoverInput" 
                                           name="albumCoverInput" 
                                           placeholder="https://example.com/cover.png">
                                </div>
                            </div>
                            
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-primary">Save new album</button>
                            </div>
                        </form>
                 
                    </div>
                </div>
            </div>
        </section>
        
        <%-- Bootstrap JS Bundle (includes Popper) --%>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
