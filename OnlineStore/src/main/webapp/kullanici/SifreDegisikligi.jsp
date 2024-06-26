<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sifre Degisikligi</title>

<link rel="stylesheet" href="../css/Home.css">
<link rel="stylesheet" href="../css/Urunler.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
</head>
<body>
    
<%@ include file="Header.jsp" %>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form class="needs-validation" novalidate>
                <div class="form-group">
                    <input type="password" class="form-control" id="eskiSifre" name="eskiSifre" placeholder="Eski Şifre" required>
                    <div class="invalid-feedback">
                        Lütfen eski şifrenizi giriniz.
                    </div>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="yeniSifre" name="yeniSifre" placeholder="Yeni Şifre" required>
                    <div class="invalid-feedback">
                        Lütfen yeni şifrenizi giriniz.
                    </div>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="yeniSifreTekrar" name="yeniSifreTekrar" placeholder="Yeni Şifre Tekrar" required>
                    <div class="invalid-feedback">
                        Yeni şifrenizi tekrar giriniz.
                    </div>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Değiştir</button>
            </form>
        </div>
    </div>
</div>

<%@ include file="Footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<script>
    // Bootstrap form validation initialization
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            var forms = document.getElementsByClassName('needs-validation');
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>

</body>
</html>
