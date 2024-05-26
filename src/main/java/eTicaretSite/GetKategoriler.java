package eTicaretSite;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/GetKategoriler")
public class GetKategoriler extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// Veritabanı bağlantı bilgileri
    private String dbURL = "jdbc:mysql://localhost:3306/eticaret";
    private String dbUser = "root";
    private String dbPassword = "123456";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword)) {
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT id, kategori_adi FROM kategoriler");

            List<Kategori> kategoriler = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String kategoriAdi = resultSet.getString("kategori_adi");
                Kategori kategori = new Kategori(id, kategoriAdi);
                kategoriler.add(kategori);
            }

            // Kategorileri JSON formatında yanıt olarak gönder
            PrintWriter writer = response.getWriter();
            writer.println(kategorilerToJson(kategoriler));
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private String kategorilerToJson(List<Kategori> kategoriler) {
        StringBuilder json = new StringBuilder();
        json.append("[");
        for (int i = 0; i < kategoriler.size(); i++) {
            Kategori kategori = kategoriler.get(i);
            json.append("{\"id\": ").append(kategori.getId()).append(", \"kategori_adi\": \"")
                    .append(kategori.getKategoriAdi()).append("\"}");
            if (i < kategoriler.size() - 1) {
                json.append(",");
            }
        }
        json.append("]");
        return json.toString();
    }
}

class Kategori {
    private int id;
    private String kategoriAdi;

    public Kategori(int id, String kategoriAdi) {
        this.id = id;
        this.kategoriAdi = kategoriAdi;
    }

    public int getId() {
        return id;
    }

    public String getKategoriAdi() {
        return kategoriAdi;
    }
}
