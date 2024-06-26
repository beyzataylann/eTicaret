<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Controller.kullaniciController,model.kullaniciModel,java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Üye Kayıt Kontrolü</title>
</head>
<body>

    <%
    // Retrieve form data
                String kullaniciAdi = request.getParameter("kullaniciAdi");
                String sifre = request.getParameter("sifre");
                String ad = request.getParameter("ad");
                String soyad = request.getParameter("soyad");
                String eMail = request.getParameter("eMail");

                // Initialize variables
                boolean kullaniciExists = false;

                // Create an instance of uyeController to interact with the database
                kullaniciController uyeController = new kullaniciController();

                // Check if kullaniciAdi already exists in the database
                List<kullaniciModel> uyeler = uyeController.readingData();
                for (kullaniciModel uye : uyeler) {
                    if (uye.getKullaniciAdi().equals(kullaniciAdi)) {
                        kullaniciExists = true;
                        break;
                    }
                }

                if (kullaniciExists) {
                    // If kullaniciAdi exists, set session attribute and redirect to the registration page
                    session.setAttribute("kayit", "true");
                    response.sendRedirect("kullaniciKayit.jsp");
                } else {
                    // If kullaniciAdi does not exist, create a new uyeModel object and add it to the database
                    kullaniciModel yeniUye = new kullaniciModel(kullaniciAdi, ad, soyad, "", eMail, sifre, ""); // Adjusted to match the constructor
                    uyeController.Add(yeniUye);

                    // Set session attribute and redirect to the registration success page
                    session.setAttribute("kayit", "false");
                    response.sendRedirect("kullaniciKayit.jsp");
                }
    %>

</body>
</html>
