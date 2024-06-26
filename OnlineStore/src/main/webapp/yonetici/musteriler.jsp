<%@ page import="Controller.kullaniciController"%>
<%@ page import="model.kullaniciModel"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kullanıcı Listesi</title>
    <link rel="stylesheet" href="path/to/bootstrap.min.css"> <!-- Bootstrap stil dosyasını ekleyin -->
</head>
<body>
    <%
        kullaniciController dboo = new kullaniciController();
        List<kullaniciModel> uyeler = dboo.readingData();
    %>

    <div class="alert alert-secondary" style="margin-top: 200px" role="alert">
        <h4 id="list-item-1" class="ml-4">Müşteriler</h4>
    </div>
    <hr>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-secondary ml-4 my-2" data-toggle="modal" data-target="#exampleModalLong">
        Müşteri Ekle
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Müşteri Bilgileri</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row" style="width: 100%">
                        <div class="col-12 bg-white py-3 my-3">
                            <div style="background-color: white">
                                <div class="mb-5 order-bottom">
                                    <a href="adminpanel.jsp"><img src="../img/gk.jpg" class="img6 trans1 b" alt=""></a>
                                </div>
                                <div style="margin-top: 120px;" class="p-3 mb-3">
                                    <form class="needs-validation" action="musteriEkle.jsp" method="post" novalidate>
                                        <div class="md mt-3">
                                            <input type="text" class="form-control" id="validationCustom01" name="kullaniciAdi" placeholder="Kullanıcı Adı" required>
                                            <div class="valid-feedback">
                                                Kullanıcı Adı Giriniz
                                            </div>
                                        </div>
                                        <div class="md mt-3">
                                            <input type="text" class="form-control" id="validationCustom01" name="ad" placeholder="Ad" required>
                                            <div class="valid-feedback">
                                                Ad Giriniz
                                            </div>
                                        </div>
                                        <div class="md mt-3">
                                            <input type="text" class="form-control" id="validationCustom02" name="soyad" placeholder="Soyad" required>
                                            <div class="valid-feedback">
                                                Soyad Giriniz
                                            </div>
                                        </div>
                                        <div class="md mt-3">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="validationCustomUsername" name="telefonNumarasi" aria-describedby="inputGroupPrepend" placeholder="Telefon" required>
                                                <div class="invalid-feedback">
                                                    Telefon
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group md mt-3">
                                            <input type="text" class="form-control" aria-describedby="inputGroupPrepend" name="kullaniciMail" placeholder="Email" required>
                                            <div class="invalid-feedback">
                                                Email Adresinizi Giriniz
                                            </div>
                                        </div>
                                        <div class="form-group md">
                                            <input type="password" class="form-control" aria-describedby="inputGroupPrepend" name="sifre" placeholder="Şifre" required>
                                            <div class="invalid-feedback">
                                                Şifrenizi Giriniz
                                            </div>
                                        </div>
                                        <div class="mt mt-3">
                                            <input type="text" class="form-control" name="kullaniciAdres" aria-describedby="inputGroupPrepend" placeholder="Adres" required>
                                            <div class="invalid-feedback">
                                                Adres Giriniz
                                            </div>
                                        </div>
                                        <button class="btn bg-secondary btn-lg btn-block mt-5 ml-1 mb-4" type="submit" style="color: white">Ekle</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-4"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="row mt-2">
        <div class="col-12">
            <table class="table table-hover px-5">
                <thead>
                    <tr>
                        <th scope="col">Kullanıcı Adı</th>
                        <th scope="col">Adı</th>
                        <th scope="col">Soyadı</th>
                        <th scope="col">Telefon</th>
                        <th scope="col">Email</th>
                        <th scope="col">Şifre</th>
                        <th scope="col">Adres</th>
                        <th scope="col">İşlemler</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    for(kullaniciModel uye : uyeler) {
                    %>
                    <tr>
                        <th scope="row"><%= uye.getKullaniciAdi() %></th>
                        <td><%= uye.getAd() %></td>
                        <td><%= uye.getSoyad() %></td>
                        <td><%= uye.getTelefonNumarasi() %></td>
                        <td><%= uye.getKullaniciMail() %></td>
                        <td><%= uye.getKullaniciSifre() %></td>
                        <td><%= uye.getKullaniciAdres() %></td>
                        <td>
                            <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#exampleModalLong">
                                Güncelle
                            </button>
                            <a href="musteriSil.jsp?kullaniciAdi=<%= uye.getKullaniciAdi() %>"><button type="button" class="btn btn-danger ml-2">
                                Sil
                            </button></a>
                        </td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap ve jQuery dosyalarını ekleyin -->
    <script src="path/to/jquery.min.js"></script>
    <script src="path/to/bootstrap.bundle.min.js"></script>
</body>
</html>
