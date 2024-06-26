<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="model.urunModel" %>

<div class="nava fx bg-dark " style="width: 100%">
    <nav class="navbar navbar-light ml-3"> <!-- ml-3 sınıfı eklendi -->
        <form class="form-inline yer1">
            <input class="form-control mr-sm-2 opak1" id="font1" style="width: 600px;height: 50px" type="search" placeholder="Aradiginiz Urunun Adini Yaziniz" aria-label="Search">
            <button class="btn btn-outline-light ml-3 text-monospace" type="submit">Ara</button>
        </form>

        <%-- Kullanıcı çerezini kontrol etmek için 
        <% 
            String cookieName = "username";
            Cookie[] cookies = request.getCookies();
            Cookie myCookie = null;
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals(cookieName)) {
                        myCookie = cookie;
                        break;
                    }
                }
            }
        %> 41. satirin ustune suslu parantez kapatma gelecek  --%>

        <ul class="nav justify-content-end mt-3 mr-5 ">
          <%--  <% 
                  if (myCookie != null && myCookie.getValue().equals("true")) {
            %>  --%>
                    <li class="nav-item hover1">
                        <a class="nav-link text-white" href="KisiselBilgilerim.jsp"><img src="../img/users.jpg" class="ml-3 img1" alt=""><br>Hesabim</a>
                    </li>
          <%--  <%      
                } else {
            %> --%>
                    <li class="nav-item hover1">
                        <a class="nav-link text-white" href="kullaniciGiris.jsp"><img src="../img/users.jpg" class="ml-3 img1" alt=""><br>Hesabim</a>
                    </li>
            <%  
              
                
                List<urunModel> urunlerim = (List<urunModel>) session.getAttribute("sepet");
                int urunSayisi = (urunlerim != null) ? urunlerim.size() : 0;
            %>

            <li class="nav-item hover1">
                <a class="nav-link text-white" href="Sepetim.jsp"><img src="../img/sepet.png" class="img1" alt=""><span class="rounded-circle" style="padding:2px;background-color:#f50"><%= urunSayisi %></span><br> Sepetim</a>
            </li>
        </ul>
    </nav>

    <div class="alert bg-dark  fx" style="width:100%;" role="alert">
        <ul class="mb-4 ul1">
            <li class="li1">
                <a class="aa ab" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample" id="gk">
                    <img src="../img/bar-icon.png" class="img1" alt=""> Tum Kategoriler
                </a>
            </li>
            <div id="list-example">
                <li class="li1"><a href="Home.jsp#list-item-1" class="aa ab" id="asd">Yeni Urunler</a></li>
                <li class="li1"><a href="Home.jsp#list-item-2" class="aa ab">Indirimdekiler</a></li>
                <li class="li1"><a href="Home.jsp#list-item-3" class="aa ab">Cok Satanlar</a></li>
                
                <li class="li1"><a href="Home.jsp#list-item-5" class="aa ab">Iletisim</a></li>
            </div>
        </ul>
        <a href="Home.jsp"><img src="../img/logo.jpg" class="img2 trans1" alt=""></a>
    </div>
</div>
