package eTicaret;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/Register", name = "RegServlet")

public class RegServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ad = request.getParameter("ad");
        String soyad = request.getParameter("soyad");
        String email = request.getParameter("email");
        String sifre = request.getParameter("sifre");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
        	
            // Veritabanı bağlantısını yap
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eticaret?useSSL=false&serverTimezone=UTC", "root", "123456");

            // Kullanıcıyı veritabanına ekle
            String sql = "INSERT INTO kullanicilar (ad, soyad, email, sifre) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, ad);
            stmt.setString(2, soyad);
            stmt.setString(3, email);
            stmt.setString(4, sifre);
            stmt.executeUpdate();

            // Kayıt başarılı mesajını göster
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script type=\"text/javascript\">");
            response.getWriter().println("alert('Kayıt başarıyla tamamlandı!');");
            response.getWriter().println("window.location.href='login.jsp';");
            response.getWriter().println("</script>");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Veritabanı sürücüsü bulunamadı!");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Veritabanı hatası!");
        } finally {
            // Kaynakları serbest bırak
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
