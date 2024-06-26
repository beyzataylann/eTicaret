<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="Controller.siparisController, model.siparisModel"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Siparişler</title>
<!-- Bootstrap veya diğer CSS dosyalarını burada import edebilirsiniz -->
</head>
<body>
    <div class="container">
        <div class="alert alert-secondary mt-2" role="alert">
            <h4 id="list-item-4" class="ml-4">Siparisler</h4>
        </div>
        <hr>

        <div class="row">
            <div class="col-1"></div>
            <div class="col-10">
                <table class="table table-hover px-5">
                    <thead>
                        <tr>
                            <th scope="col">Siparis Kodu</th>
                            <th scope="col">Kullanıcı Id</th>
                            <th scope="col">Ürün Id</th>
                            <th scope="col">Ürün Adı</th>
                            <th scope="col">Ürün Adet</th>
                            <th scope="col">Toplam Fiyat</th>
                            <th scope="col">Tarih</th>
                            <th scope="col">İşlemler</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${siparisler}" var="siparis">
                            <tr>
                                <td>${siparis.siparisId}</td>
                                <td>${siparis.kullaniciId}</td>
                                <td>${siparis.urunId}</td>
                                <td>${siparis.urunAdi}</td>
                                <td>${siparis.urunAdet}</td>
                                <td>${siparis.toplamFiyat}</td>
                                <td>${siparis.tarih}</td>
                                <td>
                                    <a href="#">Güncelle</a> |
                                    <a href="#">Sil</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
