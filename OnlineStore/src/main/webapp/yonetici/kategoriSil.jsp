<%@page import ="Controller.kategoriController,model.kategoriModel"%>

<%
			String id=request.getQueryString();
			int index=Integer.valueOf(id);
			kategoriModel kategori=new kategoriModel(index);
			kategoriController db=new kategoriController();
			db.remove(kategori);
			response.sendRedirect("yoneticipanel.jsp#list-item-2");
%>