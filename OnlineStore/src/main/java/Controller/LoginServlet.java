package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.kullaniciModel;
import model.yoneticiModel;

@WebServlet("/kullanici/kullaniciGiris")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private kullaniciController uyeCtrl;
    private yoneticiController yoneticiCtrl;

    @Override
    public void init() {
        uyeCtrl = new kullaniciController();
        yoneticiCtrl = new yoneticiController();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || password == null) {
            request.setAttribute("errorMessage", "Kullanıcı adı veya şifre boş olamaz.");
            request.getRequestDispatcher("kullaniciGiris.jsp").forward(request, response);
            return;
        }

        kullaniciModel user = new kullaniciModel(username, password, null, null, null, null, null);
        yoneticiModel admin = new yoneticiModel(username, password);

        boolean isUserValid = uyeCtrl.control(user);
        boolean isAdminValid = yoneticiCtrl.control(admin);

        if (isUserValid) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("Home.jsp");
        } else if (isAdminValid) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            response.sendRedirect("../yonetici/yoneticipanel.jsp");
        } else {
            request.setAttribute("errorMessage", "Geçersiz kullanıcı adı veya şifre");
            request.getRequestDispatcher("kullaniciGiris.jsp").forward(request, response);
        }
    }
}
