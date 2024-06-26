<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Controller.kullaniciController"%>
<%@ page import="model.kullaniciModel"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Üye Sil</title>
    <link rel="stylesheet" href="path/to/bootstrap.min.css"> <!-- Bootstrap stil dosyasını ekleyin -->
</head>
<body>
    <div class="container mt-5">
        <h2>Üye Sil</h2>
        <form method="post">
            <div class="form-group">
                <label for="kullaniciAdi">Kullanıcı Adı:</label>
                <input type="text" class="form-control" id="kullaniciAdi" name="kullaniciAdi" required>
            </div>
            <button type="submit" class="btn btn-danger">Üye Sil</button>
        </form>
        <br>

        <%-- Üye silme işlemi --%>
        <%
            String kullaniciAdi = request.getParameter("kullaniciAdi");

            if (kullaniciAdi != null && !kullaniciAdi.isEmpty()) {
                try {
                    kullaniciController controller = new kullaniciController();
                    kullaniciModel uye = controller.readingData(kullaniciAdi);

                    if (uye != null) {
                        controller.Remove(uye);
                        response.sendRedirect("adminpanel.jsp#list-item-1");
                    } else {
                        out.println("<div class='alert alert-danger'>Belirtilen kullanıcı adına sahip üye bulunamadı.</div>");
                    }
                } catch (Exception e) {
                    out.println("<div class='alert alert-danger'>Üye silinirken bir hata oluştu: " + e.getMessage() + "</div>");
                }
            }
        %>
    </div>

    <!-- Bootstrap ve jQuery dosyalarını ekleyin -->
    <script src="path/to/jquery.min.js"></script>
    <script src="path/to/bootstrap.bundle.min.js"></script>
</body>
</html>
