<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
try {
    // Veritabanı bağlantısı için gerekli bilgiler
    String url = "jdbc:mysql://localhost:3306/eticaret";
    String username = "root";
    String password = "";

    // Veritabanına bağlan
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(url, username, password);

    // Ürünleri veritabanından al
    String query = "SELECT urun_adi, aciklama, fiyat, stok_miktari FROM urunler";
    Statement statement = connection.createStatement();
    ResultSet resultSet = statement.executeQuery(query);

    // Her bir ürün için kart oluştur
    while (resultSet.next()) {
        String urunAdi = resultSet.getString("urun_adi");
        String aciklama = resultSet.getString("aciklama");
        double fiyat = resultSet.getDouble("fiyat");
        int stokMiktari = resultSet.getInt("stok_miktari");
%>
<div class="col-md-4">
    <div class="card">
        <img src="img/nope.svg" alt="Ürün Fotoğrafı" class="card-img-top">
        <div class="card-body">
            <h5 class="card-title"><%= urunAdi %></h5>
            <p class="card-text"><%= aciklama %></p>
            <p class="card-text">Fiyat: <%= fiyat %> TL</p>
            <p class="card-text">Stok Miktarı: <%= stokMiktari %></p>
            <button class="btn btn-success">Sepete Ekle</button>
        </div>
    </div>
</div>
<%
    }

    // Veritabanı bağlantısını kapat
    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>
