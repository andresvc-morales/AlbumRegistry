/**
 * Represents an Album entity in the Album Registry system.
 * This class stores information about music albums including their title,
 * author/artist, cover image path, and available stock quantity.
 *
 * @author andres
 */
package pack.model;

public class Album {
    private int id;
    private String albumName;
    private String albumAuthor;
    private String albumCoverPath;
    private int albumStock; 
    
    /**
     * Default constructor for Album class.
     */
    public Album() {
    }
    
    /**
     * Constructs a new Album with all fields initialized.
     * @param id The unique identifier for the album
     * @param albumName The name/title of the album
     * @param albumAuthor The author/artist of the album
     * @param albumCoverPath The URL path to the album's cover image
     * @param albumStock The number of copies in stock
     */
    public Album(int id, String albumName, String albumAuthor, String albumCoverPath, int albumStock) {
        this.id = id;
        this.albumName = albumName;
        this.albumAuthor = albumAuthor;
        this.albumCoverPath = albumCoverPath;
        this.albumStock = albumStock;
    }
    
    /**
     * Gets the album's unique identifier.
     * @return The album ID
     */
    public int getId() {
        return id;
    }
    
    /**
     * Gets the album's name/title.
     * @return The name of the album
     */
    public String getAlbumName() {
        return albumName;
    }
    
    /**
     * Gets the album's author/artist.
     * @return The name of the author/artist
     */
    public String getAlbumAuthor() {
        return albumAuthor;
    }
    
    /**
     * Gets the path to the album's cover image.
     * @return The URL path to the cover image
     */
    public String getAlbumCoverPath() {
        return albumCoverPath;
    }
    
    /**
     * Gets the number of copies in stock.
     * @return The current stock quantity
     */
    public int getAlbumStock() {
        return albumStock;
    }
    
    /**
     * Sets the album's unique identifier.
     * @param id The new ID for the album
     */
    public void setId(int id) {
        this.id = id;
    }
    
    /**
     * Sets the album's name/title.
     * @param albumName The new name for the album
     */
    public void setAlbumName(String albumName) {
        this.albumName = albumName;
    }
    
    /**
     * Sets the album's author/artist.
     * @param albumAuthor The new author/artist name
     */
    public void setAlbumAuthor(String albumAuthor) {
        this.albumAuthor = albumAuthor;
    }
    
    /**
     * Sets the path to the album's cover image.
     * @param albumCoverPath The new URL path to the cover image
     */
    public void setAlbumCoverPath(String albumCoverPath) {
        this.albumCoverPath = albumCoverPath;
    }
    
    /**
     * Sets the number of copies in stock.
     * @param albumStock The new stock quantity
     */
    public void setAlbumStock(int albumStock) {
        this.albumStock = albumStock;
    }

    /**
     * Returns a string representation of the Album object.
     * @return A string containing all album information
     */
    @Override
    public String toString() {
        return "Album{" +
                "id=" + id +
                ", albumName='" + albumName + '\'' +
                ", albumAuthor='" + albumAuthor + '\'' +
                ", albumCoverPath='" + albumCoverPath + '\'' +
                ", albumStock=" + albumStock +
                '}';
    }
}
