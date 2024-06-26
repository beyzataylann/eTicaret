<%@ page import="Controller.kategoriController" %>
<%@ page import="model.kategoriModel" %>
<%@ page import="java.util.List" %>
<%
    kategoriController db = new kategoriController();
    List<kategoriModel> kategoriler = db.readingData();
%>

<div class="collapse bg-light" id="collapseExample">
    <div id='cssmenu' class="menu3" style="height: 100%">
        <h4 class="ml-3 text-dark">Tüm Kategoriler</h4>
        <hr>

        <ul class="list-group">
            <% if (kategoriler != null && !kategoriler.isEmpty()) { %>
                <% for (kategoriModel kategori : kategoriler) { %>
                    <li class="ab border-bottom list-group-item ab2" style="height: 50px">
                        <a href="Urunler.jsp?k=<%= kategori.getKategoriId() %>" role="button" type="submit" style="width: 100%">
                            <p class="ml-2 float-left" style="font-size: 15px"><%= kategori.getKategoriAdi() %></p>
                        </a>
                    </li>
                <% } %>
            <% } else { %>
                <li class="list-group-item">No categories found.</li>
            <% } %>
        </ul>
    </div>
</div>