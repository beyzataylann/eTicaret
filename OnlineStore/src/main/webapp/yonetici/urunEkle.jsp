<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, Controller.urunController, model.urunModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ürün Ekle</title>
</head>
<body>
    <h2>Ürün Ekle</h2>
    <form method="post" action="urunEkle.jsp">
        <label for="urunKodu">Ürün Kodu:</label>
        <input type="text" id="urunKodu" name="urunKodu" required><br><br>
        
        <label for="urunAdi">Ürün Adı:</label>
        <input type="text" id="urunAdi" name="urunAdi" required><br><br>
        
        <label for="urunDetay">Ürün Detayı:</label><br>
        <textarea id="urunDetay" name="urunDetay" rows="4" cols="50"></textarea><br><br>
        
        <label for="urunFiyat">Ürün Fiyatı:</label>
        <input type="text" id="urunFiyat" name="urunFiyat" required><br><br>
        
        <label for="urunAdet">Ürün Adeti:</label>
        <input type="text" id="urunAdet" name="urunAdet" required><br><br>
        
        <label for="urunFotograf">Ürün Fotoğrafı (URL):</label>
        <input type="text" id="urunFotograf" name="urunFotograf" required><br><br>
        
        <label for="kategoriKodu">Kategori Kodu:</label>
        <input type="text" id="kategoriKodu" name="kategoriKodu" required><br><br>
        
        <input type="submit" value="Ürünü Ekle">
    </form>

    <%-- Ürün eklenince yönlendirme işlemi --%>
    <% 
        String urunKodu = request.getParameter("urunKodu");
        String urunAdi = request.getParameter("urunAdi");
        String urunDetay = request.getParameter("urunDetay");
        String urunFiyat = request.getParameter("urunFiyat");
        String urunAdet = request.getParameter("urunAdet");
        String urunFotograf = request.getParameter("urunFotograf");
        String kategoriKodu = request.getParameter("kategoriKodu");

        if (urunKodu != null && urunAdi != null && urunFiyat != null && urunAdet != null && urunFotograf != null && kategoriKodu != null &&
            !urunKodu.isEmpty() && !urunAdi.isEmpty() && !urunFiyat.isEmpty() && !urunAdet.isEmpty() && !urunFotograf.isEmpty() && !kategoriKodu.isEmpty()) {
            
            try {
                int uKodu = Integer.parseInt(urunKodu);
                int uFiyat = Integer.parseInt(urunFiyat);
                int uAdet = Integer.parseInt(urunAdet);
                int uKategori = Integer.parseInt(kategoriKodu);
                
                urunModel urun = new urunModel(uKodu, urunAdi, urunDetay, uFiyat, uAdet, urunFotograf, uKategori);
                urunController controller = new urunController();
                controller.add(urun);
                
                response.sendRedirect("adminpanel.jsp#list-item-2");
                
            } catch (NumberFormatException e) {
                out.println("Geçersiz sayısal format.");
            } catch (Exception e) {
                out.println("Ürün eklenirken bir hata oluştu: " + e.getMessage());
            }
            
        } else {
            out.println("Lütfen tüm alanları doldurun.");
        }
    %>
</body>
</html>
