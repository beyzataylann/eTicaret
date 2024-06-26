<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.urunModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ödeme Kontrol Sayfası</title>
</head>
<body>
<%
    String odemeTipi = request.getParameter("tip");
    List<urunModel> sepet = (List<urunModel>) session.getAttribute("sepet");
    double toplamFiyat = 0;

    if (sepet != null && !sepet.isEmpty()) {
        for (urunModel urun : sepet) {
            toplamFiyat += urun.getUrunFiyat();
        }
    }

    if ("true".equals(session.getAttribute("onay"))) {
        if ("kapidaOdeme".equals(odemeTipi)) {
%>
            <script>
                alert("Siparişiniz alındı! Kapıda ödeme seçeneği ile işlem tamamlandı.");
                window.location.href = "siparislerim.jsp"; // Opsiyonel olarak yönlendirme
            </script>
<%
        } else if ("krediKarti".equals(odemeTipi)) {
%>
            <script>
                alert("Siparişiniz alındı! Kredi kartı ile ödeme işlemi tamamlandı.");
                window.location.href = "siparislerim.jsp"; // Opsiyonel olarak yönlendirme
                            </script>
<%
        } else {
%>
            <script>
                alert("Geçersiz ödeme tipi seçildi. Lütfen tekrar deneyiniz.");
                window.history.back(); // Geri dönüş yap
            </script>
<%
        }
    } else {
%>
        <script>
            alert("Ödeme onayı yapılmamış. Lütfen ödeme işlemini tekrar kontrol ediniz.");
            window.history.back(); // Geri dönüş yap
        </script>
<%
    }
%>
</body>
</html>
                