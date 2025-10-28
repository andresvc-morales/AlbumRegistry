/**
 * Database connection handler for the Album Registry application.
 * This class manages all database operations including CRUD operations for albums.
 *
 * @author andres
 */
package pack.connection;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import pack.model.Album;
public class DBConnection {
    // Database connection configuration
    // TODO: Move these to environment variables 
    private static final String URL = "jdbc:mysql://localhost:3306/Albums";
    private static final String USER = "root";
    private static final String PASSWORD = "Admin$1234";
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";

    private java.sql.Connection conn;

    public DBConnection() {
        try {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException ex) {
            throw new RuntimeException("Class not found", ex);
        } catch (SQLException ex) {
            throw new RuntimeException("SQL Exception", ex);
        }
    }

    public java.sql.Connection getConnection() {
        return conn;
    }
    
    /**
     * Retrieves all albums from the database.
     * @return A list of Album objects containing all album records
     * @throws RuntimeException if there's an error retrieving the data
     */
    public List<Album> getAlbumInfo() {
        List<Album> albums = new ArrayList<>();
        try ( PreparedStatement p = conn.prepareStatement("SELECT * FROM information");
            ResultSet rs = p.executeQuery()){
           
            while(rs.next()) {
                Album album = new Album();
                album.setId(rs.getInt("id"));
                album.setAlbumName(rs.getString("album_name"));
                album.setAlbumAuthor(rs.getString("album_author"));
                album.setAlbumCoverPath(rs.getString("album_cover"));
                album.setAlbumStock(rs.getInt("album_stock"));
                albums.add(album);
            }
            rs.close();
            p.close();

        } catch (SQLException ex) {
            throw new RuntimeException("Error retrieving albums info from database", ex);
        }
        return albums;
    }

    /**
     * Inserts a new album into the database.
     * @param albumName The name of the album
     * @param albumAuthor The author/artist of the album
     * @param albumCover The URL path to the album cover image
     * @param albumStock The number of copies in stock
     * @return The ID of the newly inserted album, or -1 if insertion failed
     * @throws IllegalArgumentException if any of the parameters are invalid
     * @throws RuntimeException if there's an error executing the database operation
     */
    public int insertNewAlbum(String albumName, String albumAuthor, String albumCover, int albumStock) {


        if(albumName == null || albumName.trim().isEmpty()) {
            throw new IllegalArgumentException("Album name cannot be empty");

        }
        if(albumAuthor == null || albumAuthor.trim().isEmpty()) {
            throw new IllegalArgumentException("Album author cannot be empty");
            
        }
        if(albumCover == null || albumCover.trim().isEmpty()) {
            throw new IllegalArgumentException("Album cover path cannot be empty");
            
        }
        if (albumStock < 0) {
            throw new IllegalArgumentException("Album stock cannot be negative");
        }

       String sql = "INSERT INTO information(album_name, album_author, album_cover, album_stock) VALUES (?, ?, ?, ?)";
    
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            pstmt.setString(1, albumName);
            pstmt.setString(2, albumAuthor);
            pstmt.setString(3, albumCover);
            pstmt.setInt(4, albumStock);

            pstmt.executeUpdate();

            ResultSet rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }

            pstmt.close();

        } catch (SQLException e) {
            throw new RuntimeException("Error inserting album" + albumName, e);
        }

        return -1; 
    }
    /**
     * Updates an existing album in the database.
     * @param albumId The ID of the album to update
     * @param albumName The new name of the album
     * @param albumAuthor The new author/artist of the album
     * @param albumCover The new URL path to the album cover image
     * @param albumStock The new stock quantity
     * @return true if the album was successfully updated, false otherwise
     * @throws IllegalArgumentException if any of the parameters are invalid
     * @throws RuntimeException if there's an error executing the database operation
     */
    public boolean editAlbum(int albumId, String albumName, String albumAuthor, String albumCover, int albumStock) {
      if(albumName == null || albumName.trim().isEmpty()) {
          throw new IllegalArgumentException("Album name cannot be empty");
      }
      if(albumAuthor == null || albumAuthor.trim().isEmpty()) {
          throw new IllegalArgumentException("Album author cannot be empty");
      }
      if(albumCover == null || albumCover.trim().isEmpty()) {
          throw new IllegalArgumentException("Album cover path cannot be empty");
      }
      if (albumStock < 0) {
          throw new IllegalArgumentException("Album stock cannot be negative");
      }

      String sql = "UPDATE information SET album_name = ?, album_author = ?, album_cover = ?, album_stock = ? WHERE id = ?";

      try {
          PreparedStatement pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, albumName);
          pstmt.setString(2, albumAuthor);
          pstmt.setString(3, albumCover);
          pstmt.setInt(4, albumStock);
          pstmt.setInt(5, albumId);

          int rowsAffected = pstmt.executeUpdate();
          pstmt.close();

          return rowsAffected > 0;
      } catch (SQLException e) {
          throw new RuntimeException("Error updating album " + albumName, e);
      }
    }
    /**
     * Deletes an album from the database.
     * @param id The ID of the album to delete
     * @return true if the album was successfully deleted, false otherwise
     */
    public boolean deleteAlbum(int id) {
       try {
           String sql = "DELETE FROM information WHERE id = ?";
           PreparedStatement ps = conn.prepareStatement(sql);
           ps.setInt(1, id);
           int rows = ps.executeUpdate();
           return rows > 0;
       } catch(Exception e) {
           e.printStackTrace();
           return false;
       }
   }
    /**
     * Closes the database connection.
     * @throws SQLException if there's an error closing the connection
     */
    public void close() throws SQLException {
            try {
                conn.close();
            } catch (SQLException ex) {
                throw ex;
            }
        }
    }
