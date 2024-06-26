<%@page import ="Controller.yoneticiController,model.yoneticiModel"%>

<%
			String id=request.getQueryString();
			yoneticiModel yonetici =new yoneticiModel(id);
			yoneticiController dbyonetici =new yoneticiController();
			dbyonetici.Remove(yonetici);
			response.sendRedirect("yoneticipanel.jsp#list-item-5");
%>