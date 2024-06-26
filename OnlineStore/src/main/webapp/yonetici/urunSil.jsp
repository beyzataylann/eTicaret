<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Controller.urunController, model.urunModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ürün Sil</title>
</head>
<body>
    <h2>Ürün Sil</h2>
    
    <% 
        String urunKodu = request.getParameter("urunKodu");
        
        if (urunKodu != null && !urunKodu.isEmpty()) {
            try {
                int uKodu = Integer.parseInt(urunKodu);
                
                urunModel urun = new urunModel(uKodu); // urunModel nesnesi oluşturuluyor
                urunController controller = new urunController();
                controller.remove(uKodu); // urunKodu parametresi ile remove metoduna doğrudan gönderiliyor
                
                response.sendRedirect("yoneticipanel.jsp#list-item-3");
                
            } catch (NumberFormatException e) {
                out.println("Geçersiz ürün ID formatı.");
            } catch (Exception e) {
                out.println("Ürün silinirken bir hata oluştu: " + e.getMessage());
            }
        } else {
            out.println("Lütfen geçerli bir ürün ID girin.");
        }
    %>
</body>
</html>
