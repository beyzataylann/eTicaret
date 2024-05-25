package eTicaretSite;

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

@WebServlet("/KategoriEkle")
public class CategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String kategoriAdi = request.getParameter("kategoriAdi");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Veritabanı bağlantısını yap
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eticaret", "root", "serce");

            // Kategoriyi veritabanına ekle
            stmt = conn.prepareStatement("INSERT INTO kategoriler (kategori_adi) VALUES (?)");
            stmt.setString(1, kategoriAdi);
            stmt.executeUpdate();

            // Kayıt başarılı mesajını göster
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script type=\"text/javascript\">");
            response.getWriter().println("alert('Kategori başarıyla eklendi!');");
            response.getWriter().println("window.location.href='admin.jsp';");
            response.getWriter().println("</script>");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
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
