package Controller;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.kategoriModel;

public class kategoriController extends database {

    public List<kategoriModel> readingData() {
        List<kategoriModel> liste = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sorgu = "SELECT * FROM kategori";
            con = connect();
            ps = con.prepareStatement(sorgu);
            rs = ps.executeQuery();
            while (rs.next()) {
                kategoriModel kategori = new kategoriModel(
                    rs.getInt("kategoriId"), 
                    rs.getString("kategoriAdi")
                );
                liste.add(kategori);
            }
        } catch (SQLException exception) {
            setErrorMessage("Bir hata meydana geldi: " + exception);
        } finally {
            closeResources(con, ps, rs);
        }
        return liste;
    }

    public void add(kategoriModel kategori) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            String sorgu = "INSERT INTO kategori(kategoriId, kategoriAdi) VALUES(?, ?)";
            con = connect();
            ps = con.prepareStatement(sorgu);
            ps.setInt(1, kategori.getKategoriId());
            ps.setString(2, kategori.getKategoriAdi());
            ps.executeUpdate();
        } catch (SQLException exception) {
            setErrorMessage(exception.toString());
        } finally {
            closeResources(con, ps, null);
        }
    }

    public void remove(kategoriModel kategori) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            String sorgu = "DELETE FROM kategori WHERE kategoriId = ?";
            con = connect();
            ps = con.prepareStatement(sorgu);
            ps.setInt(1, kategori.getKategoriId());
            ps.executeUpdate();
        } catch (SQLException exception) {
            setErrorMessage(exception.toString());
        } finally {
            closeResources(con, ps, null);
        }
    }

    public void update(kategoriModel kategori) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            String sorgu = "UPDATE kategori SET kategoriAdi = ? WHERE kategoriId = ?";
            con = connect();
            ps = con.prepareStatement(sorgu);
            ps.setString(1, kategori.getKategoriAdi());
            ps.setInt(2, kategori.getKategoriId());
            ps.executeUpdate();
        } catch (SQLException exception) {
            setErrorMessage(exception.toString());
        } finally {
            closeResources(con, ps, null);
        }
    }

    public boolean control(kategoriModel kt) {
        boolean result = false;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sorgu = "SELECT kategoriId FROM kategori WHERE kategoriId = ?";
            con = connect();
            ps = con.prepareStatement(sorgu);
            ps.setInt(1, kt.getKategoriId());
            rs = ps.executeQuery();
            if (rs.next()) {
                result = true;
            }
        } catch (SQLException exception) {
            setErrorMessage(exception.toString());
        } finally {
            closeResources(con, ps, rs);
        }
        return result;
    }
}
