<%@ page import="model.kullaniciModel" %>
<%@ page import="Controller.kullaniciController" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kullanıcı Girişi Kontrolü</title>
</head>
<body>
    <%
        String kullaniciAdi = request.getParameter("kullaniciAdi");
        String sifre = request.getParameter("sifre");

        kullaniciModel kullanici = new kullaniciModel(kullaniciAdi, sifre, null, null, null, null, null); // kullaniciModel instance oluştur

        kullaniciController controller = new kullaniciController();
        boolean result = controller.control(kullanici); // control metoduna kullaniciModel instance geçir

        if (result) {
            // Kullanıcı doğrulandıysa
            session.setAttribute("authenticated", true);
            session.setAttribute("username", kullaniciAdi);

            // Cookie oluştur ve tarayıcıya gönder
            Cookie cookie = new Cookie("username", kullaniciAdi);
            cookie.setMaxAge(60 * 60 * 24); // 1 gün
            response.addCookie(cookie);

            response.sendRedirect("Home.jsp");
        } else {
            // Kullanıcı doğrulanamadıysa
            session.setAttribute("authenticated", false);
            session.setAttribute("username", null);

            // Hatalı giriş için ayrı bir cookie oluştur
            Cookie errorCookie = new Cookie("username", "false");
            errorCookie.setMaxAge(60 * 60 * 24); // 1 gün
            response.addCookie(errorCookie);

            response.sendRedirect("kullaniciGiris.jsp");
        }
    %>
</body>
</html>
