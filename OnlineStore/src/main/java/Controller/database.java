package Controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class database {

    private String dbUrl = "jdbc:mysql://localhost:3306/eticaret";
    private String dbUsername = "root";
    private String dbPassword = "";

    // Method to establish a connection to the database
    protected Connection connect() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure the JDBC driver is loaded
            return DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        } catch (ClassNotFoundException e) {
            throw new SQLException("JDBC Driver not found", e);
        }
    }

    // Method to close the resources
    public void closeResources(Connection con, PreparedStatement ps, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            setErrorMessage("Error closing resources: " + e);
        }
    }

    // Method to set error messages (now protected)
    protected void setErrorMessage(String message) {
        // Implement your error handling logic here (e.g., logging to a file)
        System.err.println(message); // Example: Print the message to the standard error stream
    }
}
