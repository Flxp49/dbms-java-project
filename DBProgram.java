import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import io.github.cdimascio.dotenv.Dotenv;

public class DBProgram {
    public static void main(String[] args) {
        try {
            // env variable
            Dotenv dotenv = Dotenv.load();

            // Registering the driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connection
            Connection conn = DriverManager.getConnection(dotenv.get("mysqlurl"));

            // Query statement object
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("show databases ");
            System.out.println("List of databases: ");
            while (rs.next()) {
                System.out.print(rs.getString(1));
                System.out.println();
            }

        } catch (SQLException e) {
            System.out.println("ERROR");
            System.out.println("SQLException: " + e.getMessage());
            System.out.println("SQLState: " + e.getSQLState());
            System.out.println("VendorError: " + e.getErrorCode());
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}