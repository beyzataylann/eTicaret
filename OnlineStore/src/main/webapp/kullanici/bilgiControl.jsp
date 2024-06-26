<%@page import="model.kullaniciModel"%>
<%@page import="Controller.kullaniciController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Üye Bilgileri Güncelleme</title>
</head>
<body>
    <%
        String cookieName = "username";
        Cookie cookies[] = request.getCookies();
        Cookie myCookie = null;
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals(cookieName)) {
                    myCookie = cookies[i];
                    break;
                }
            }
        }

        if (myCookie != null) {
            String kullaniciAdi = myCookie.getValue();
            String ad = request.getParameter("ad");
            String soyad = request.getParameter("soyad");
            String telefonNumarasi = request.getParameter("telefonNumarasi");
            String kullaniciMail = request.getParameter("kullaniciMail");
            String sifre = request.getParameter("sifre");
            String kullaniciAdres = request.getParameter("kullaniciAdres");

            kullaniciModel kullaniciM = new kullaniciModel(kullaniciAdi, sifre, ad, soyad, telefonNumarasi, kullaniciMail, kullaniciAdres);
            kullaniciController dbKullanici = new kullaniciController();
            dbKullanici.Update(kullaniciM);

            response.sendRedirect("KisiselBilgilerim.jsp");
        } else {
            // Handle case where cookie is not found
            response.sendRedirect("kullaniciGiriş.jsp");
        }
    %>
</body>
</html>
