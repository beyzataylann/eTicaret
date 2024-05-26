package eTicaretSite;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UrunEkle")
public class ProductServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Gelen parametreleri al
        String urunAdi = request.getParameter("urunAdi");
        String urunAciklamasi = request.getParameter("urunAciklamasi");
        double urunFiyati = Double.parseDouble(request.getParameter("urunFiyati"));
        int urunStokMiktari = Integer.parseInt(request.getParameter("urunStokMiktari"));
        String kategoriSecimi = request.getParameter("kategoriSecimi");
        
        // Veritabanı bağlantısı
        String url = "jdbc:mysql://localhost:3306/eticaret";
        String user = "root";
        String password = "123456";
        Connection connection = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);
            
            // Veritabanına ekleme sorgusu
            String sql = "INSERT INTO urunler (urun_adi, aciklama, fiyat, stok_miktari, kategori_id) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, urunAdi);
            statement.setString(2, urunAciklamasi);
            statement.setDouble(3, urunFiyati);
            statement.setInt(4, urunStokMiktari);
            statement.setString(5, kategoriSecimi);
            
            // Sorguyu çalıştır
            statement.executeUpdate();
            
            // İşlem başarılı mesajını gönder
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("Ürün başarıyla eklendi!");
        } catch (ClassNotFoundException | SQLException e) {
            // Hata durumunda hata mesajını gönder
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Ürün eklenirken bir hata oluştu.");
            e.printStackTrace();
        } finally {
            // Veritabanı bağlantısını kapat
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
