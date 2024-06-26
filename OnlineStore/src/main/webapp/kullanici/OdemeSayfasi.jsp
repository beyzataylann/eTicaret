<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ödeme Sayfası</title>
</head>
<body>
    <h1>Ödeme Yöntemi Seçiniz</h1>
    <form action="${pageContext.request.contextPath}/kullanici/odemeController" method="post">
        <input type="radio" name="tip" value="kapidaOdeme" required> Kapıda Ödeme<br>
        <input type="radio" name="tip" value="krediKarti"> Kredi Kartı<br>
        <input type="radio" name="tip" value="havale"> Havale<br>
        <button type="submit">Ödeme Yap</button>
    </form>
</body>
</html>