<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Controller.yoneticiController, model.yoneticiModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Yönetici Ekle</title>
</head>
<body>
    <h2>Yönetici Ekle</h2>
    
    <% 
        String kullaniciAdi = request.getParameter("kullaniciAdi");
        String sifre = request.getParameter("sifre");
        
        yoneticiModel yonetici = new yoneticiModel(kullaniciAdi, sifre);
        yoneticiController controller = new yoneticiController();
        
        boolean result = controller.control(yonetici);
        
        if (result) {
            // Yönetici zaten varsa güncelle
            controller.Update(yonetici);
        } else {
            // Yönetici yoksa ekle
            controller.Add(yonetici);
        }
        
        response.sendRedirect("yonetimpanel.jsp#list-item-5");
    %>
</body>
</html>
