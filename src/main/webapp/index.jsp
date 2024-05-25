<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Anasayfa</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <style>
        .accordion-item {
            background-color: #47b58d;
            color: #fff;
        }

        .accordion-button {
            color: #fff;
            background-color: #059862;
        }

        .card {
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <!-- Navbar Başlangıç -->
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand mx-4" id="navb" href="#home">YokYok</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="mynavbar">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item mx-2">
                        <a class="nav-link" href="#home">Anasayfa</a>
                    </li>
                    <li class="nav-item me-2">
                        <a class="nav-link" href="cart.jsp">Sepet ( )</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp">Üye Ol</a>
                    </li>
                    <li class="nav-item me-4">
                        <a class="nav-link" href="login.jsp">Giriş Yap</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Navbar Bitiş -->

    <!-- Anasayfa Başlangıç -->
    <section class="home py-5" id="home">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="accordion" id="accordionExample">
                        <% 
                            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/eticaret", "root", "serce")) {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                String categoryQuery = "SELECT id, kategori_adi FROM kategoriler";
                                try (Statement categoryStatement = connection.createStatement();
                                     ResultSet categoryResultSet = categoryStatement.executeQuery(categoryQuery)) {
                                    
                                    while (categoryResultSet.next()) {
                                        int kategoriId = categoryResultSet.getInt("id");
                                        String kategoriAdi = categoryResultSet.getString("kategori_adi");
                        %>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="heading<%= kategoriId %>">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<%= kategoriId %>" aria-expanded="false" aria-controls="collapse<%= kategoriId %>" data-kategoriid="<%= kategoriId %>">
                                    <%= kategoriAdi %>
                                </button>
                            </h2>
                            <div id="collapse<%= kategoriId %>" class="accordion-collapse collapse" aria-labelledby="heading<%= kategoriId %>" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <% 
                                        String productQuery = "SELECT urun_adi FROM urunler WHERE kategori_id = " + kategoriId;
                                        try (Statement productStatement = connection.createStatement();
                                             ResultSet productResultSet = productStatement.executeQuery(productQuery)) {
                                            
                                            while (productResultSet.next()) {
                                                String urunAdi = productResultSet.getString("urun_adi");
                                    %>
                                    <div class="accordion-body">
                                        <a href="#" class="text-decoration-none text-white"><%= urunAdi %></a>
                                    </div>
                                    <% 
                                            }
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                        <% 
                                    }
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </div>
                </div>

                <div class="col-md-9">
                    <div class="row" id="productContainer">
                        <%
                            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/eticaret", "root", "serce")) {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                String query = "SELECT urun_adi, aciklama, fiyat, stok_miktari FROM urunler";
                                try (Statement statement = connection.createStatement();
                                     ResultSet resultSet = statement.executeQuery(query)) {
                                    
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
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Anasayfa Bitiş -->

    <script>
        // Akordiyon butonlarına click event listener ekleme
        const accordionButtons = document.querySelectorAll('.accordion-button');
        accordionButtons.forEach(button => {
            button.addEventListener('click', function() {
                const kategoriId = button.dataset.kategoriid;
                loadProductsByCategory(kategoriId);
            });
        });

        // Seçilen kategoriye göre ürünleri yükleme
        function loadProductsByCategory(kategoriId) {
            const productContainer = document.getElementById('productContainer2');

            // AJAX ile ürünleri veritabanından al
            const xhr = new XMLHttpRequest();
            xhr.open('GET', 'getProducts.jsp?kategoriId=' + kategoriId, true);
            xhr.onload = function() {
                if (this.status === 200) {
                    productContainer.innerHTML = this.responseText;
                }
            };
            xhr.send();
        }
        
        // Tüm ürünleri yükleme
        function loadAllProducts() {
            const productContainer = document.getElementById('productContainer2');

            // AJAX ile tüm ürünleri veritabanından al
            const xhr = new XMLHttpRequest();
            xhr.open('GET', 'getAllProducts.jsp', true);
            xhr.onload = function() {
                if (this.status === 200) {
                    productContainer.innerHTML = this.responseText;
                }
            };
            xhr.send();
        }

        // Anasayfa butonuna click event listener ekleme
        const homeButton = document.querySelector('.nav-link[href="#home"]');
        homeButton.addEventListener('click', function() {
            loadAllProducts();
        });

        const iconButton = document.querySelector('.navbar-brand[href="#home"]');
        iconButton.addEventListener('click', function() {
            loadAllProducts();
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js