package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.urunModel; // urunModel sınıfının bulunduğu paket

@WebServlet("/SepeteEkle")
public class SepeteEkleController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Ürün bilgilerini al
        int urunKodu = Integer.parseInt(request.getParameter("urunKodu"));
        String urunAdi = request.getParameter("urunAdi");
        double urunFiyat = Double.parseDouble(request.getParameter("urunFiyat"));
        String urunFotograf = request.getParameter("urunFotograf");

        // Kullanıcı Id'sini al
        HttpSession session = request.getSession();
        Integer kullaniciId = (Integer) session.getAttribute("kullaniciId");
        
        if (kullaniciId == null) {
            // Kullanıcı oturum açmamışsa hata mesajı ver
            response.sendRedirect("kullaniciGiris.jsp");
            return;
        }

        // Yeni ürün oluştur
        urunModel yeniUrun = new urunModel(urunKodu, urunFotograf, urunAdi, (int) urunFiyat);

        // Session'dan sepeti al
        List<urunModel> sepet = (List<urunModel>) session.getAttribute("sepet");
        if (sepet == null) {
            sepet = new ArrayList<>();
        }

        // Ürünü sepete ekle
        sepet.add(yeniUrun);
        session.setAttribute("sepet", sepet);

        // Loglama
        System.out.println("Ürün sepete eklendi: " + yeniUrun);

        // Yönlendirme
        response.sendRedirect("Sepetim.jsp");
    }
}