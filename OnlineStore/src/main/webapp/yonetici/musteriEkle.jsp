<%@page import ="Controller.kullaniciController,model.kullaniciModel"%>

<%
String kullaniciAdi=request.getParameter("kullaniciAdi");
String sifre=request.getParameter("sifre");
String ad=request.getParameter("ad");
String soyad=request.getParameter("soyad");
String telefon=request.getParameter("telefon");
String mail=request.getParameter("mail");
String sehir=request.getParameter("sehir");
String ilce=request.getParameter("ilce");
String adres=request.getParameter("adres");

kullaniciModel uye=new kullaniciModel(kullaniciAdi,ad,soyad,telefon,mail,sifre,adres);
kullaniciController db=new kullaniciController();
boolean result=db.control(uye);
	
if(result){
	
	db.Update(uye);
}
else{
	
	db.Add(uye);
}
response.sendRedirect("yoneticipanel.jsp#list-item-1");
%>