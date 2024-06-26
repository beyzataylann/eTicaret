<%@ page import="Controller.kategoriController, model.kategoriModel" %>

<%
    // Formdan gelen parametreleri al
    String kategoriNumarasi = request.getParameter("kategoriNumarasi");
    String kategoriAdi = request.getParameter("kategoriAdi");

    // Eğer kategoriNumarasi veya kategoriAdi boş ise hata mesajı göster ve işlem yapma
    if (kategoriNumarasi == null || kategoriAdi == null || kategoriNumarasi.isEmpty() || kategoriAdi.isEmpty()) {
        response.sendRedirect("yoneticipanel.jsp?error=missing_parameters");
    } else {
        try {
            // kategoriNumarasi'ni integer'a çevir
            int kNumarasi = Integer.parseInt(kategoriNumarasi);

            // kategoriModel oluştur
            kategoriModel kt = new kategoriModel(kNumarasi, kategoriAdi);

            // kategoriController oluştur
            kategoriController dbe = new kategoriController();

            // Kontrol et, varsa güncelle, yoksa ekle
            if (dbe.control(kt)) {
                dbe.update(kt);
            } else {
                dbe.add(kt);
            }

            // Başarılıysa admin paneline geri yönlendir
            response.sendRedirect("yoneticipanel.jsp#list-item-2");
        } catch (NumberFormatException e) {
            
            response.sendRedirect("yoneticipanel.jsp?error=invalid_number_format");
        }
    }
%>
