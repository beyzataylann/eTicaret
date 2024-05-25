<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!-- --------------------------------- -->
<%
// Veritabanı bağlantısı için gerekli bilgiler
String url = "jdbc:mysql://localhost:3306/eticaret";
String username = "root";
String password = "serce";

// Veritabanına bağlantı oluştur
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
try {
    Class.forName("com.mysql.jdbc.Driver");
    connection = DriverManager.getConnection(url, username, password);

    // Kullanıcı sayısını çekmek için sorgu
    statement = connection.createStatement();
    resultSet = statement.executeQuery("SELECT COUNT(*) AS kullanici_sayisi FROM kullanicilar");
    int userCount = 0;
    if (resultSet.next()) {
        userCount = resultSet.getInt("kullanici_sayisi");
    }
    resultSet.close(); // resultSet'ı kapat

    // Kategori sayısını çekmek için sorgu
    resultSet = statement.executeQuery("SELECT COUNT(*) AS kategori_sayisi FROM kategoriler");
    int categoryCount = 0;
    if (resultSet.next()) {
        categoryCount = resultSet.getInt("kategori_sayisi");
    }
    resultSet.close(); // resultSet'ı kapat

    // Ürün sayısını çekmek için sorgu
    resultSet = statement.executeQuery("SELECT COUNT(*) AS urun_sayisi FROM urunler");
    int productCount = 0;
    if (resultSet.next()) {
        productCount = resultSet.getInt("urun_sayisi");
    }

    // JSP sayfasında değerleri kullanmak üzere değişkenlere atanır
    request.setAttribute("userCount", userCount);
    request.setAttribute("categoryCount", categoryCount);
    request.setAttribute("productCount", productCount);
} catch (ClassNotFoundException e) {
    e.printStackTrace();
} catch (SQLException e) {
    e.printStackTrace();
} finally {
    // Kaynakları serbest bırak
    if (resultSet != null) {
        try {
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (statement != null) {
        try {
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (connection != null) {
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
%>
<!-- ------------------------------------------------------------ -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Sayfası</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
</head>

<body>
    <!-- Navbar Başlangıç -->
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <div class="container-fluid">
          <a class="navbar-brand mx-4" href="/index.html">YokYok</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="mynavbar">
            <ul class="navbar-nav ms-auto">
              <li class="nav-item mx-2">
                <a class="nav-link" href="index.jsp">Anasayfa</a>
              </li>
              <li class="nav-item me-2">
                <a class="nav-link" href="login.jsp">Çıkış Yap</a>
            </ul>
          </div>
        </div>
      </nav>
  <!-- Navbar Bitiş -->

  <!-- Başlangıç -->

  <section class="admin py-4" id="admin">

    <div class="container">
        <div class="welcome-text" style="text-align: center;">
            <h1>Hoşgeldin Admin</h1>
          </div>
        <div class="row mt-5">
          <div class="col-md-4">
            <div class="card text-center">
                <img src="img/users.png" style="width:100px;height:100px" class="card-img-top mx-auto mt-3" alt="Kullanıcı Sayısı">
              <div class="card-body">
                <h5 class="card-title">Kullanıcı Sayısı</h5>
                <p class="card-text"><%= request.getAttribute("userCount") %></p>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card text-center">
                <img src="img/category.png" style="width:100px;height:100px" class="card-img-top mx-auto mt-3" alt="Kullanıcı Sayısı">
              <div class="card-body">
                <h5 class="card-title">Kategori Sayısı</h5>
                <p class="card-text"><%= request.getAttribute("categoryCount") %></p>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card text-center">
                <img src="img/product.png" style="width:100px;height:100px" class="card-img-top mx-auto mt-3" alt="Kullanıcı Sayısı">
              <div class="card-body">
                <h5 class="card-title">Ürün Sayısı</h5>
                <p class="card-text"><%= request.getAttribute("productCount") %></p>
              </div>
            </div>
          </div>
        </div>
        <div class="row mt-5">
          <div class="col-md-6">
            <div class="card text-center">
                <img src="img/catadd.png" style="width:100px;height:100px" class="card-img-top mx-auto mt-3" alt="Kullanıcı Sayısı">
              <div class="card-body">
                <h5 class="card-title">Kategori</h5>
                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#kategoriModal">
                  Ekle
                </button>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="card text-center">
                <img src="img/add.png" style="width:100px;height:100px" class="card-img-top mx-auto mt-3" alt="Kullanıcı Sayısı">
              <div class="card-body">
                <h5 class="card-title">Ürün</h5>
                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#urunModal">
                  Ekle
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    
      <!-- Kategori Ekle Modal -->
      <div class="modal fade" id="kategoriModal" tabindex="-1" aria-labelledby="kategoriModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="kategoriModalLabel">Kategori Ekle</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form>
                <div class="mb-3">
                  <label for="kategoriAdi" class="form-label">Kategori Adı</label>
                  <input type="text" class="form-control" id="kategoriAdi" name="kategoriAdi" placeholder="Kategori adını girin">
                </div>
              </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success">Ekle</button>
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Kapat</button>              
            </div>
          </div>
        </div>
      </div>
    
      <!-- Ürün Ekle Modal -->
	<div class="modal fade" id="urunModal" tabindex="-1" aria-labelledby="urunModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="urunModalLabel">Ürün Ekle</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form action="UrunEkle" method="post" enctype="multipart/form-data">
	          <div class="mb-3">
	            <label for="urunAdi" class="form-label">Ürün İsmi</label>
	            <input type="text" class="form-control" id="urunAdi" name="urunAdi" placeholder="Ürün ismini girin">
	          </div>
	          <div class="mb-3">
	            <label for="urunAciklamasi" class="form-label">Açıklama</label>
	            <textarea class="form-control" id="urunAciklamasi" name="urunAciklamasi" placeholder="Ürün açıklamasını girin"></textarea>
	          </div>
	          <div class="mb-3">
	            <label for="urunFiyati" class="form-label">Fiyat</label>
	            <input type="number" class="form-control" id="urunFiyati" name="urunFiyati" placeholder="Ürün fiyatını girin">
	          </div>
	          <div class="mb-3">
	            <label for="urunStokMiktari" class="form-label">Stok Miktarı</label>
	            <input type="number" class="form-control" id="urunStokMiktari" name="urunStokMiktari" placeholder="Ürün stok miktarını girin">
	          </div>
	          <div class="mb-3">
	            <label for="kategoriSecimi" class="form-label">Kategori Seçimi</label>
	            <input type="number" class="form-control" id="kategoriSecimi" name="kategoriSecimi" placeholder="Kategori seçin.">
	          </div>
<!-- 	          <div class="mb-3"> -->
<!-- 	            <label for="fotoYukleme" class="form-label">Fotoğraf Yükleme</label> -->
<!-- 	            <input type="file" class="form-control" id="fotoYukleme" name="fotoYukleme"> -->
<!-- 	          </div> -->
	        </form>
	      </div>
	      <div class="modal-footer">
	          <button type="button" class="btn btn-success" id="urunEkleBtn">Ekle</button>
	          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Kapat</button>
	      </div>
	    </div>
	  </div>
	</div>

  </section>

  <!-- Bitiş -->
  <script>
  document.querySelector("#kategoriModal button.btn-success").addEventListener("click", function() {
    var kategoriAdi = document.getElementById("kategoriAdi").value;

    // AJAX isteği için XMLHttpRequest nesnesi oluştur
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "KategoriEkle", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    // Sunucudan yanıt alındığında yapılacak işlemler
    xhr.onreadystatechange = function() {
      if (xhr.readyState === 4 && xhr.status === 200) {
        // İşlem başarılı mesajını göster ve sayfayı yenile
        alert("Kategori başarıyla eklendi!");
        window.location.href = "admin.jsp";
      }
    };

    // Verileri gönder
    xhr.send("kategoriAdi=" + encodeURIComponent(kategoriAdi));
  });
</script>

<script>
  document.querySelector("#urunModal #urunEkleBtn").addEventListener("click", function() {
    var urunAdi = document.getElementById("urunAdi").value;
    var urunAciklamasi = document.getElementById("urunAciklamasi").value;
    var urunFiyati = document.getElementById("urunFiyati").value;
    var urunStokMiktari = document.getElementById("urunStokMiktari").value;
    var kategoriSecimi = document.getElementById("kategoriSecimi").value;

    // AJAX isteği için XMLHttpRequest nesnesi oluştur
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "UrunEkle", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    // Sunucudan yanıt alındığında yapılacak işlemler
    xhr.onreadystatechange = function() {
      if (xhr.readyState === 4 && xhr.status === 200) {
        // İşlem başarılı mesajını göster ve sayfayı yenile
        alert("Ürün başarıyla eklendi!");
        window.location.href = "admin.jsp";
      }
    };

    // Verileri gönder
    var params = "urunAdi=" + encodeURIComponent(urunAdi) +
                 "&urunAciklamasi=" + encodeURIComponent(urunAciklamasi) +
                 "&urunFiyati=" + encodeURIComponent(urunFiyati) +
                 "&urunStokMiktari=" + encodeURIComponent(urunStokMiktari) +
                 "&kategoriSecimi=" + encodeURIComponent(kategoriSecimi);
    xhr.send(params);
  });
</script>


      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>