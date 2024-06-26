<%@page import ="model.yoneticiModel,Controller.yoneticiController"  %>

<%

	String kullaniciAdi=request.getParameter("kullaniciAdi");
	String sifre=request.getParameter("sifre");

	yoneticiModel uModel=new yoneticiModel(kullaniciAdi,sifre);
	yoneticiController yoneticiControl=new yoneticiController();
	boolean result=yoneticiControl.control(uModel);
	if(result) {
	 
		 session.setAttribute("yoneticiSession","true");
		 
		 response.sendRedirect("yoneticipanel.jsp");
	 		
	}
	else {
	 	
		
		
		session.setAttribute("yoneticiSession","false");
		response.sendRedirect("kullaniciGiris.jsp");
	 
	}

%>