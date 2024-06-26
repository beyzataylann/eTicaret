<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>

    <!-- Link to your custom CSS file -->
    <link rel="stylesheet" href="../css/Home.css">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">

    <style>
        /* Additional inline styles can go here if needed */
        /* General Styles */
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #3498db, #2c3e50);
            font-family: 'Open Sans', sans-serif;
            color: #333;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            max-width: 400px;
            width: 100%;
            margin: 20px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9); /* Yarı saydam beyaz arka plan */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: center;
            flex-direction: column;
            align-items: center;
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .logo-container {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .logo-container img {
            max-width: 100px; /* Adjust the size as needed */
            height: auto;
        }

        .form-group {
            margin-bottom: 15px;
            width: 100%;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-group button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }

        .register-link {
            text-align: center;
            margin-top: 10px;
        }

        .register-link a {
            color: #007bff;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <div class="logo-container">
            <a href="Home.jsp"><img src="../img/logo.jpg" alt="Logo"></a>
        </div>
        <h2>Giriş Yap</h2>
        <form action="${pageContext.request.contextPath}/kullanici/kullaniciGiris" method="post">
            <div class="form-group">
                <label for="username">Kullanıcı Adı:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Şifre:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>
        </form>
        
        <!-- Display error message if present -->
        <div class="error-message">${errorMessage}</div>
        
        <!-- Link to register if not a member -->
        <div class="register-link">
            Üye değil misin? <a href="${pageContext.request.contextPath}/kullanici/kullaniciKayit.jsp">Üye Ol</a>
        </div>
    </div>
    
    <!-- Bootstrap and other JavaScript libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>
