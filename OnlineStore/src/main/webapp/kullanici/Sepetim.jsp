<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.urunModel" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sepetim</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 15px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Sepetim</h1>
    <%
        List<urunModel> sepet = (List<urunModel>) session.getAttribute("sepet");
        double toplamFiyat = 0;
        if (sepet == null || sepet.isEmpty()) {
    %>
    <p>Sepetiniz boş.</p>
    <%
        } else {
    %>
    <table>
        <tr>
            <th>Ürün Kodu</th>
            <th>Ürün Adı</th>
            <th>Ürün Fiyatı</th>
            <th>Ürün Fotoğrafı</th>
        </tr>
        <%
            for (urunModel urun : sepet) {
                toplamFiyat += urun.getUrunFiyat();
        %>
        <tr>
            <td><%= urun.getUrunKodu() %></td>
            <td><%= urun.getUrunAdi() %></td>
            <td><%= urun.getUrunFiyat() %> TL</td>
            <td><img src="<%= urun.getUrunFotograf() %>" alt="<%= urun.getUrunAdi() %>" style="width:100px;height:auto;"></td>
        </tr>
        <%
            }
        %>
    </table>
    <h2>Toplam Fiyat: <%= formatToplamFiyat(toplamFiyat) %> TL</h2>
    <%
        }
    %>
    <form action="OdemeSayfasi.jsp" method="post">
        <input type="submit" value="Ödeme Yap">
    </form>

    <%!
        String formatToplamFiyat(double toplamFiyat) {
            DecimalFormat df = new DecimalFormat("#.##");
            return df.format(toplamFiyat);
        }
    %>

</body>
</html>
