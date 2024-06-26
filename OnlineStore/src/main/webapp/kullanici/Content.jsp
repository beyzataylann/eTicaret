<%@ page import="Controller.urunController" %>
<%@ page import="model.urunModel" %>
<%@ page import="java.util.List" %>

<%
    urunController urunCtrl = new urunController();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ürün Listesi</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .card-img-top {
            width: 100px; /* Resim butonlarının genişliği */
            height: auto; /* Yükseklik otomatik olarak ayarlanacak */
        }
    </style>
</head>
<body>

<div data-spy="scroll" data-target="#list-example" data-offset="0" class="scrollspy-example mt-3">
    <!-- Kategori 1 için ürünler -->
    <div class="alert alert-secondary mt-2" role="alert">
        <h4 id="list-item-1" class="ml-4">MODA</h4>
    </div>
    <hr>
    
            <% 
                List<urunModel> urunlerKategori1 = urunCtrl.urunleriGetirByKategori(1);
                if (urunlerKategori1 != null && !urunlerKategori1.isEmpty()) {
                    for (urunModel urun : urunlerKategori1) {
            %>
                    <div class="card mt-2 ml-4 mb-3 hover12" id="<%= urun.getUrunKodu() %>">
                        <img src="../img/<%= urun.getUrunFotograf() %>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%= urun.getUrunAdi() %></h5>
                            <p class="card-text"><%= urun.getUrunDetay() %></p>
                            <span><%= urun.getUrunFiyat() %> TL</span>
                            <a href="homeUrun.jsp?urunKodu=<%= urun.getUrunKodu() %>&urunFotograf=<%= urun.getUrunFotograf() %>&urunAdi=<%= urun.getUrunAdi() %>&urunFiyati=<%= urun.getUrunFiyat() %>" class="btn btn-success float-right">
                                <span><img src="../img/sepet.png" alt="" style="width: 25px" class="mr-1"></span>Sepete Ekle
                            </a>
                        </div>
                    </div>
            <% 
                    }
                } else {
                    out.println("No products found for category 1.");
                }
            %>
        </div>
    </div>

    <!-- Kategori 2 için ürünler -->
    <div class="alert alert-secondary mt-2" role="alert">
        <h4 id="list-item-2" class="ml-4">ELEKTRONIK</h4>
    </div>
    <hr>
    
            <% 
                List<urunModel> urunlerKategori2 = urunCtrl.urunleriGetirByKategori(2);
                if (urunlerKategori2 != null && !urunlerKategori2.isEmpty()) {
                    for (urunModel urun : urunlerKategori2) {
            %>
                    <div class="card mt-2 ml-4 mb-3 hover12" id="<%= urun.getUrunKodu() %>">
                        <img src="../img/<%= urun.getUrunFotograf() %>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%= urun.getUrunAdi() %></h5>
                            <p class="card-text"><%= urun.getUrunDetay() %></p>
                            <span><%= urun.getUrunFiyat() %> TL</span>
                            <a href="homeUrun.jsp?urunKodu=<%= urun.getUrunKodu() %>&urunFotograf=<%= urun.getUrunFotograf() %>&urunAdi=<%= urun.getUrunAdi() %>&urunFiyati=<%= urun.getUrunFiyat() %>" class="btn btn-success float-right">
                                <span><img src="../img/sepet.png" alt="" style="width: 25px" class="mr-1"></span>Sepete Ekle
                            </a>
                        </div>
                    </div>
            <% 
                    }
                } else {
                    out.println("No products found for category 2.");
                }
            %>
     
    <!-- Kategori 3 için ürünler -->
    <div class="alert alert-secondary mt-2" role="alert">
        <h4 id="list-item-3" class="ml-4">KISISEL BAKIM</h4>
    </div>
    <hr>
   
            <% 
                List<urunModel> urunlerKategori3 = urunCtrl.urunleriGetirByKategori(3);
                if (urunlerKategori3 != null && !urunlerKategori3.isEmpty()) {
                    for (urunModel urun : urunlerKategori3) {
            %>
                    <div class="card mt-2 ml-4 mb-3 hover12" id="<%= urun.getUrunKodu() %>">
                        <img src="../img/<%= urun.getUrunFotograf() %>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%= urun.getUrunAdi() %></h5>
                            <p class="card-text"><%= urun.getUrunDetay() %></p>
                            <span><%= urun.getUrunFiyat() %> TL</span>
                            <a href="homeUrun.jsp?urunKodu=<%= urun.getUrunKodu() %>&urunFotograf=<%= urun.getUrunFotograf() %>&urunAdi=<%= urun.getUrunAdi() %>&urunFiyati=<%= urun.getUrunFiyat() %>" class="btn btn-success float-right">
                                <span><img src="../img/sepet.png" alt="" style="width: 25px" class="mr-1"></span>Sepete Ekle
                            </a>
                        </div>
                    </div>
            <% 
                    }
                } else {
                    out.println("No products found for category 3.");
                }
            %>
        </div>
    </div>

    <!-- Diğer kategori ve içerikler buraya eklenebilir -->
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
