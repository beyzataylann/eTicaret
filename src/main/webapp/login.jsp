<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Sayfası</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <style>
        .login-container {
          width: 400px;
          margin: 0 auto;
          margin-top: 100px;
          padding: 20px;
          border-radius: 5px;
          box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }
      </style>
</head>

<body>
    <!-- Navbar Başlangıç -->
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <div class="container-fluid">
          <a class="navbar-brand mx-4" href="index.jsp">YokYok</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="mynavbar">
            <ul class="navbar-nav ms-auto">
              <li class="nav-item mx-2">
                <a class="nav-link" href="index.jsp">Anasayfa</a>
              </li>
              <li class="nav-item me-2">
                <a class="nav-link" href="cart.jsp">Sepet ( )</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="register.jsp">Üye Ol</a>
              </li>
              <li class="nav-item me-4">
                <a class="nav-link" href="#login">Giriş Yap</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
  <!-- Navbar Bitiş -->

  <!-- Başlangıç -->

  <section class="login py-4" id="login">
    <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="login-container">
              <h3 class="text-center mb-4">Giriş Yap</h3>
              <form id="login-form" action="Login" method="post">
                <div class="mb-3">
                  <label for="email" class="form-label">E-posta</label>
                  <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                  <label for="password" class="form-label">Şifre</label>
                  <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="mb-3 form-check">
                  <input type="checkbox" class="form-check-input" id="remember">
                  <label class="form-check-label" for="remember">Beni hatırla</label>
                </div>
                <button type="submit" class="btn btn-success">Giriş Yap</button>
              </form>
              <div class="text-center mt-3">
                <a href="register.jsp" style="text-decoration: none;color: darkgreen;">Üye değil misin?</a></p>
              </div>
            </div>
          </div>
        </div>
      </div>
  </section>
  

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>