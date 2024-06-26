package Controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.urunModel;

public class urunController {

    private database database;

    public urunController() {
        database = new database();
    }

    public List<urunModel> readingData(int kategoriKodu) {
        String sorgu = "SELECT * FROM urun WHERE kategoriKodu=?";
        try (Connection con = database.connect();
             PreparedStatement ps = con.prepareStatement(sorgu)) {
            ps.setInt(1, kategoriKodu);
            try (ResultSet rs = ps.executeQuery()) {
                List<urunModel> liste = new ArrayList<>();
                while (rs.next()) {
                    urunModel urun = new urunModel(
                        rs.getInt("urunKodu"),
                        rs.getString("urunAdi"),
                        rs.getString("urunDetay"),
                        rs.getInt("urunFiyat"),
                        rs.getInt("urunAdet"),
                        rs.getString("urunFotograf"),
                        rs.getInt("kategoriKodu"));
                    liste.add(urun);
                }
                return liste;
            }
        } catch (SQLException exception) {
            setErrorMessage("Bir hata meydana geldi: " + exception);
            return null;
        }
    }

    public List<urunModel> readingData() {
        String sorgu = "SELECT * FROM urun";
        try (Connection con = database.connect();
             PreparedStatement ps = con.prepareStatement(sorgu);
             ResultSet rs = ps.executeQuery()) {
            List<urunModel> liste = new ArrayList<>();
            while (rs.next()) {
                urunModel urun = new urunModel(
                    rs.getInt("urunKodu"),
                    rs.getString("urunAdi"),
                    rs.getString("urunDetay"),
                    rs.getInt("urunFiyat"),
                    rs.getInt("urunAdet"),
                    rs.getString("urunFotograf"),
                    rs.getInt("kategoriKodu"));
                liste.add(urun);
            }
            return liste;
        } catch (SQLException exception) {
            setErrorMessage("Bir hata meydana geldi: " + exception);
            return null;
        }
    }

    public void add(urunModel urun) {
        String sorgu = "INSERT INTO urun(urunKodu, urunAdi, urunDetay, urunFiyat, urunAdet, urunFotograf, kategoriKodu) VALUES(?,?,?,?,?,?,?)";
        try (Connection con = database.connect();
             PreparedStatement ps = con.prepareStatement(sorgu)) {
            ps.setInt(1, urun.getUrunKodu());
            ps.setString(2, urun.getUrunAdi());
            ps.setString(3, urun.getUrunDetay());
            ps.setInt(4, urun.getUrunFiyat());
            ps.setInt(5, urun.getUrunAdet());
            ps.setString(6, urun.getUrunFotograf());
            ps.setInt(7, urun.getKategoriKodu());
            ps.executeUpdate();
        } catch (SQLException exception) {
            setErrorMessage("Bir hata meydana geldi: " + exception);
        }
    }

    public void remove(int urunKodu) {
        String sorgu = "DELETE FROM urun WHERE urunKodu=?";
        try (Connection con = database.connect();
             PreparedStatement ps = con.prepareStatement(sorgu)) {
            ps.setInt(1, urunKodu);
            ps.executeUpdate();
        } catch (SQLException exception) {
            setErrorMessage("Bir hata meydana geldi: " + exception);
        }
    }

    public void update(urunModel urun) {
        String sorgu = "UPDATE urun SET urunAdi=?, urunDetay=?, urunFiyat=?, urunAdet=?, urunFotograf=?, kategoriKodu=? WHERE urunKodu=?";
        try (Connection con = database.connect();
             PreparedStatement ps = con.prepareStatement(sorgu)) {
            ps.setString(1, urun.getUrunAdi());
            ps.setString(2, urun.getUrunDetay());
            ps.setInt(3, urun.getUrunFiyat());
            ps.setInt(4, urun.getUrunAdet());
            ps.setString(5, urun.getUrunFotograf());
            ps.setInt(6, urun.getKategoriKodu());
            ps.setInt(7, urun.getUrunKodu());
            ps.executeUpdate();
        } catch (SQLException exception) {
            setErrorMessage("Bir hata meydana geldi: " + exception);
        }
    }

    public urunModel readingDataByUrunKodu(int urunKodu) {
        String sorgu = "SELECT * FROM urun WHERE urunKodu=?";
        try (Connection con = database.connect();
             PreparedStatement ps = con.prepareStatement(sorgu)) {
            ps.setInt(1, urunKodu);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new urunModel(
                        rs.getInt("urunKodu"),
                        rs.getString("urunAdi"),
                        rs.getString("urunDetay"),
                        rs.getInt("urunFiyat"),
                        rs.getInt("urunAdet"),
                        rs.getString("urunFotograf"),
                        rs.getInt("kategoriKodu"));
                }
            }
        } catch (SQLException exception) {
            setErrorMessage("Bir hata meydana geldi: " + exception);
        }
        return null;
    }

    public List<urunModel> urunleriGetirByKategori(int kategoriKodu) {
        return readingData(kategoriKodu);
    }

    private void setErrorMessage(String message) {
        System.err.println(message);
        // veya loglama yapabilirsiniz
    }
}
