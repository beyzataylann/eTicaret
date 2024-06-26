package Controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.siparisModel;


public class siparisController extends database {

    public void siparisEkle(siparisModel siparis) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = connect();
            String sorgu = "INSERT INTO siparis (kullaniciId, urunId, urunAdi, urunAdet, toplamFiyat, tarih) VALUES (?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sorgu);
            ps.setInt(1, siparis.getKullaniciId());
            ps.setInt(2, siparis.getUrunId());
            ps.setString(3, siparis.getUrunAdi());
            ps.setInt(4, siparis.getUrunAdet());
            ps.setDouble(5, siparis.getToplamFiyat());
            ps.setString(6, siparis.getTarih());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Sipariş eklenirken hata oluştu: " + ex.getMessage());
        } finally {
            closeResources(con, ps, null);
        }
    }

    public List<siparisModel> siparisleriGetir() {
        List<siparisModel> siparisListesi = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = connect();
            String sorgu = "SELECT * FROM siparis";
            ps = con.prepareStatement(sorgu);
            rs = ps.executeQuery();
            while (rs.next()) {
                siparisModel siparis = new siparisModel(
                    rs.getInt("siparisId"),
                    rs.getInt("kullaniciId"),
                    rs.getInt("urunId"),
                    rs.getString("urunAdi"),
                    rs.getInt("urunAdet"),
                    rs.getDouble("toplamFiyat"),
                    rs.getString("tarih")
                );
                siparisListesi.add(siparis);
            }
        } catch (SQLException ex) {
            System.out.println("Siparişleri getirirken hata oluştu: " + ex.getMessage());
        } finally {
            closeResources(con, ps, rs);
        }
        return siparisListesi;
    }

    public void siparisSil(int siparisId) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = connect();
            String sorgu = "DELETE FROM siparis WHERE siparisId = ?";
            ps = con.prepareStatement(sorgu);
            ps.setInt(1, siparisId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Sipariş silinirken hata oluştu: " + ex.getMessage());
        } finally {
            closeResources(con, ps, null);
        }
    }

    public void siparisGuncelle(siparisModel siparis) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = connect();
            String sorgu = "UPDATE siparis SET kullaniciId = ?, urunId = ?, urunAdi = ?, urunAdet = ?, toplamFiyat = ?, tarih = ? WHERE siparisId = ?";
            ps = con.prepareStatement(sorgu);
            ps.setInt(1, siparis.getKullaniciId());
            ps.setInt(2, siparis.getUrunId());
            ps.setString(3, siparis.getUrunAdi());
            ps.setInt(4, siparis.getUrunAdet());
            ps.setDouble(5, siparis.getToplamFiyat());
            ps.setString(6, siparis.getTarih());
            ps.setInt(7, siparis.getSiparisId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Sipariş güncellenirken hata oluştu: " + ex.getMessage());
        } finally {
            closeResources(con, ps, null);
        }
    }
}
