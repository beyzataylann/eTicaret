package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.urunModel;

@WebServlet("/kullanici/odemeController")
public class odemeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private database db = new database();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("doPost invoked"); // Loglama

        String odemeTipi = request.getParameter("tip");
        System.out.println("Ödeme Tipi: " + odemeTipi); // Loglama

        List<urunModel> sepet = (List<urunModel>) request.getSession().getAttribute("sepet");

        if (sepet == null || sepet.isEmpty()) {
            System.out.println("Sepet boş veya null"); // Loglama
            request.setAttribute("errorMessage", "Sepetiniz boş. Lütfen önce ürün ekleyin.");
            request.getRequestDispatcher("/kullanici/OdemeSayfasi.jsp").forward(request, response);
            return;
        }

        double toplamFiyat = 0;
        for (urunModel urun : sepet) {
            toplamFiyat += urun.getUrunFiyat();
        }
        System.out.println("Toplam Fiyat: " + toplamFiyat); // Loglama

        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = db.connect();
            System.out.println("Database connected"); // Loglama

            String insertQuery = "INSERT INTO siparis (urunAdi, urunFiyat, odemeTipi) VALUES (?, ?, ?)";
            ps = conn.prepareStatement(insertQuery);

            for (urunModel urun : sepet) {
                ps.setString(1, urun.getUrunAdi());
                ps.setDouble(2, urun.getUrunFiyat());
                ps.setString(3, odemeTipi);
                ps.executeUpdate();
                System.out.println("Sipariş kaydedildi: " + urun.getUrunAdi()); // Loglama
            }

            request.getSession().setAttribute("onay", "true");

            String successMessage = "";
            if ("kapidaOdeme".equals(odemeTipi)) {
                successMessage = "Siparişiniz alındı! Kapıda ödeme seçeneği ile işlem tamamlandı.";
            } else if ("krediKarti".equals(odemeTipi)) {
                successMessage = "Siparişiniz alındı! Kredi kartı ile ödeme seçeneği ile işlem tamamlandı.";
            } else if ("havale".equals(odemeTipi)) {
                successMessage = "Siparişiniz alındı! Havale ile ödeme seçeneği ile işlem tamamlandı.";
            }
            request.setAttribute("successMessage", successMessage);

            // Redirect to "siparislerim.jsp" after successful payment
            response.sendRedirect(request.getContextPath() + "/kullanici/siparislerim.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Ödeme işlemi sırasında bir hata oluştu.");
            request.getRequestDispatcher("/kullanici/OdemeSayfasi.jsp").forward(request, response);
        } finally {
            db.closeResources(conn, ps, null);
        }
    }
}
