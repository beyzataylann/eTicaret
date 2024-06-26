package Controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.yoneticiModel;

public class yoneticiController extends database {

    public List<yoneticiModel> readingData() {
        String sorgu = "SELECT * FROM admin";
        List<yoneticiModel> liste = new ArrayList<>();
        
        try (Connection con = connect();
             PreparedStatement ps = con.prepareStatement(sorgu);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                yoneticiModel yonetici = new yoneticiModel(rs.getString("kullaniciAdi"), rs.getString("sifre"));
                liste.add(yonetici);
            }

        } catch (SQLException exception) {
            System.out.println("Bir hata meydana geldi:" + exception);
            setErrorMessage(exception.toString());
        }

        return liste;
    }

    // Overriding connect() method from database class
    @Override
    protected Connection connect() throws SQLException {
        return super.connect(); // Calling connect() method from superclass (database)
    }

    public boolean control(yoneticiModel yonetici) {
        String userName = yonetici.getKullaniciAdi();
        String password = yonetici.getSifre();
        String sorgu = "SELECT kullaniciAdi, sifre FROM admin WHERE kullaniciAdi = ?";

        try (Connection con = connect();
             PreparedStatement ps = con.prepareStatement(sorgu)) {

            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String passwordDB = rs.getString("sifre");
                return password.equals(passwordDB);
            }

        } catch (SQLException exception) {
            System.out.println("Bir hata meydana geldi:" + exception);
            setErrorMessage(exception.toString());
        }

        return false;
    }

    public void Add(yoneticiModel yonetici) {
        String sorgu = "INSERT INTO admin(kullaniciAdi, sifre) VALUES (?, ?)";

        try (Connection con = connect();
             PreparedStatement ps = con.prepareStatement(sorgu)) {

            ps.setString(1, yonetici.getKullaniciAdi());
            ps.setString(2, yonetici.getSifre());

            ps.executeUpdate();

        } catch (SQLException exception) {
            System.out.println("Bir hata meydana geldi:" + exception);
            setErrorMessage(exception.toString());
        }
    }

    public void Remove(yoneticiModel yonetici) {
        String sorgu = "DELETE FROM admin WHERE kullaniciAdi = ?";

        try (Connection con = connect();
             PreparedStatement ps = con.prepareStatement(sorgu)) {

            ps.setString(1, yonetici.getKullaniciAdi());

            ps.executeUpdate();

        } catch (SQLException exception) {
            System.out.println("Bir hata meydana geldi:" + exception);
            setErrorMessage(exception.toString());
        }
    }

    public void Update(yoneticiModel yonetici) {
        String sorgu = "UPDATE admin SET sifre = ? WHERE kullaniciAdi = ?";

        try (Connection con = connect();
             PreparedStatement ps = con.prepareStatement(sorgu)) {

            ps.setString(1, yonetici.getSifre());
            ps.setString(2, yonetici.getKullaniciAdi());

            ps.executeUpdate();

        } catch (SQLException exception) {
            System.out.println("Bir hata meydana geldi:" + exception);
            setErrorMessage(exception.toString());
        }
    }

    // Example implementation of setErrorMessage method
    protected void setErrorMessage(String message) {
        // You can implement your error handling logic here (e.g., logging to a file)
        System.err.println(message); // Example: Print the message to the standard error stream
    }
}
