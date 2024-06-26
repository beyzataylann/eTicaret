package Controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.kullaniciModel;

public class kullaniciController extends database {

    public List<kullaniciModel> readingData() {
        String sorgu = "SELECT * FROM kullanicilar";
        List<kullaniciModel> liste = new ArrayList<>();
        try (Connection con = connect();
             PreparedStatement ps = con.prepareStatement(sorgu);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                kullaniciModel kullanici = new kullaniciModel(
                    rs.getString("kullaniciAdi"),
                    rs.getString("kullanicisifre"),
                    rs.getString("Ad"),
                    rs.getString("Soyad"),
                    rs.getString("TelefonNumarasi"),
                    rs.getString("kullaniciMail"),
                    rs.getString("kullaniciAdres")
                );
                liste.add(kullanici);
            }
        } catch (SQLException exception) {
            setErrorMessage("Bir hata meydana geldi: " + exception.getMessage());
        }
        return liste;
    }

    public void Add(kullaniciModel kullanicimodel) {
        String sorgu = "INSERT INTO kullanicilar(kullaniciAdi, kullanicisifre, Ad, Soyad, TelefonNumarasi, kullaniciMail, kullaniciAdres) VALUES(?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = connect();
             PreparedStatement ps = con.prepareStatement(sorgu)) {
            ps.setString(1, kullanicimodel.getKullaniciAdi());
            ps.setString(2, kullanicimodel.getKullaniciSifre());
            ps.setString(3, kullanicimodel.getAd());
            ps.setString(4, kullanicimodel.getSoyad());
            ps.setString(5, kullanicimodel.getTelefonNumarasi());
            ps.setString(6, kullanicimodel.getKullaniciMail());
            ps.setString(7, kullanicimodel.getKullaniciAdres());

            int affectedRows = ps.executeUpdate();
            if (affectedRows == 0) {
                setErrorMessage("Veritabanına ekleme işlemi başarısız oldu, hiçbir satır etkilenmedi.");
            }
        } catch (SQLException exception) {
            setErrorMessage("Bir hata meydana geldi: " + exception.getMessage());
        }
    }

    public void Remove(kullaniciModel kullanicimodel) {
        String sorgu = "DELETE FROM kullanicilar WHERE kullaniciAdi=?";
        try (Connection con = connect();
             PreparedStatement ps = con.prepareStatement(sorgu)) {
            ps.setString(1, kullanicimodel.getKullaniciAdi());
            ps.executeUpdate();
        } catch (SQLException exception) {
            setErrorMessage("Bir hata meydana geldi: " + exception.getMessage());
        }
    }

    public void Update(kullaniciModel kullanicimodel) {
        String sorgu = "UPDATE kullanicilar SET Ad=?, Soyad=?, TelefonNumarasi=?, kullaniciMail=?, kullanicisifre=?, kullaniciAdres=? WHERE kullaniciAdi=?";
        try (Connection con = connect();
             PreparedStatement ps = con.prepareStatement(sorgu)) {
            ps.setString(1, kullanicimodel.getAd());
            ps.setString(2, kullanicimodel.getSoyad());
            ps.setString(3, kullanicimodel.getTelefonNumarasi());
            ps.setString(4, kullanicimodel.getKullaniciMail());
            ps.setString(5, kullanicimodel.getKullaniciSifre());
            ps.setString(6, kullanicimodel.getKullaniciAdres());
            ps.setString(7, kullanicimodel.getKullaniciAdi());

            ps.executeUpdate();
        } catch (SQLException exception) {
            setErrorMessage("Bir hata meydana geldi: " + exception.getMessage());
        }
    }

    public boolean control(kullaniciModel kullanici) {
        String userName = kullanici.getKullaniciAdi();
        String password = kullanici.getKullaniciSifre();
        boolean result = false;
        String sorgu = "SELECT kullaniciAdi, kullanicisifre FROM kullanicilar WHERE kullaniciAdi=? AND kullanicisifre=?";
        try (Connection con = connect();
             PreparedStatement ps = con.prepareStatement(sorgu)) {
            ps.setString(1, userName);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    result = true;
                }
            }
        } catch (SQLException exception) {
            setErrorMessage("Bir hata meydana geldi: " + exception.getMessage());
        }
        return result;
    }

    public kullaniciModel readingData(String user) {
        String sorgu = "SELECT * FROM kullanicilar WHERE kullaniciAdi=?";
        try (Connection con = connect();
             PreparedStatement ps = con.prepareStatement(sorgu)) {
            ps.setString(1, user);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new kullaniciModel(
                        rs.getString("kullaniciAdi"),
                        rs.getString("kullanicisifre"),
                        rs.getString("Ad"),
                        rs.getString("Soyad"),
                        rs.getString("TelefonNumarasi"),
                        rs.getString("kullaniciMail"),
                        rs.getString("kullaniciAdres")
                    );
                }
            }
        } catch (SQLException exception) {
            setErrorMessage("Bir hata meydana geldi: " + exception.getMessage());
        }
        return null;
    }
}
