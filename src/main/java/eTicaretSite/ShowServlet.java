//package eTicaretSite;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet("/show")
//public class ShowServlet extends HttpServlet {
//
//    /**
//	 * 
//	 */
//	private static final long serialVersionUID = 1L;
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html; charset=UTF-8");
//        PrintWriter out = response.getWriter();
//
//        // Veritabanı bağlantısı
//        String jdbcUrl = "jdbc:mysql://localhost:3306/eticaret";
//        String username = "root";
//        String password = "serce";
//
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            Connection conn = DriverManager.getConnection(jdbcUrl, username, password);
//
//            // Veritabanından ürün bilgilerini sorgula
//            String sql = "SELECT urun_adi, aciklama, fiyat, stok_miktari FROM urunler";
//            PreparedStatement statement = conn.prepareStatement(sql);
//            ResultSet resultSet = statement.executeQuery();
//
//         // Ürünleri kartlara yerleştir
//            StringBuilder cardHtml = new StringBuilder();
//
//            while (resultSet.next()) {
//                String productName = resultSet.getString("urun_adi");
//                String productDescription = resultSet.getString("aciklama");
//                double productPrice = resultSet.getDouble("fiyat");
//                int productStock = resultSet.getInt("stok_miktari");
//
//                // Ürün kartını oluştur ve verileri yerleştir
//                cardHtml.append("<div class=\"card\">");
//                cardHtml.append("<div class=\"card-body\">");
//                cardHtml.append("<h5 class=\"card-title\">" + productName + "</h5>");
//                cardHtml.append("<p class=\"card-text\">" + productDescription + "</p>");
//                cardHtml.append("<p class=\"card-text\">Fiyat: " + productPrice + " TL</p>");
//                cardHtml.append("<p class=\"card-text\">Stok: " + productStock + "</p>");
//                cardHtml.append("<button class=\"btn btn-success\" onclick=\"addToCart()\">Sepete Ekle</button>");
//                cardHtml.append("</div>");
//                cardHtml.append("</div>");
//            }
//
//            // Ürün kartlarını productContainer div'ine yerleştir
//            out.println("<script>document.getElementById('productContainer').innerHTML = '" + cardHtml.toString() + "';</script>");
//
//
//            conn.close();
//        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
//        }
//    }
//}
