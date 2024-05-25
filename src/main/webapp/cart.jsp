<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <title>Document</title>
  </head>
  <body>
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
      <div class="container-fluid">
        <a class="navbar-brand mx-4" href="index.jsp">YokYok</a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#mynavbar"
        >
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
              <a class="nav-link" href="login.jsp">Giriş Yap</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container">
      <div>
        <section class="h-100 h-custom" style="background-color: #ffffff">
          <div class="container py-5 h-100">
            <div
              class="row d-flex justify-content-center align-items-center h-100"
            >
              <div class="col">
                <div class="card">
                  <div class="card-body p-4">
                    <div class="row">
                      <div class="col-lg-12">
                        <h5 class="mb-3">
                          <a href="index.jsp" class="text-body"
                            ><i class="fas fa-long-arrow-alt-left me-2"></i
                            >Alışverişe Devam</a
                          >
                        </h5>
                        <hr />

                        <div
                          class="d-flex justify-content-between align-items-center mb-4"
                        >
                          <div>
                            <p class="mb-1">Alışveriş Sepeti</p>
                            <p class="mb-0">Sepette 4 ürün var</p>
                          </div>
                          <div>
                            <p class="mb-0">
                              <span class="text-muted">Sıralama:</span>
                              <a href="#!" class="text-body"
                                >fiyat <i class="fas fa-angle-down mt-1"></i
                              ></a>
                            </p>
                          </div>
                        </div>

                        <div class="card mb-3">
                          <div class="card-body">
                            <div class="d-flex justify-content-between">
                              <div class="d-flex flex-row align-items-center">
                                <div>
                                  <img
                                    src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img1.webp"
                                    class="img-fluid rounded-3"
                                    alt="Shopping item"
                                    style="width: 65px"
                                  />
                                </div>
                                <div class="ms-3">
                                  <h5>Iphone 11 pro</h5>
                                  <p class="small mb-0">256GB, Navy Blue</p>
                                </div>
                              </div>
                              <div class="d-flex flex-row align-items-center">
                                <div style="width: 50px">
                                  <h5 class="fw-normal mb-0">2</h5>
                                </div>
                                <div style="width: 80px">
                                  <h5 class="mb-0">$900</h5>
                                </div>
                                <a href="#!" style="color: #cecece"
                                  ><i class="fas fa-trash-alt"></i
                                ></a>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div class="card mb-3">
                          <div class="card-body">
                            <div class="d-flex justify-content-between">
                              <div class="d-flex flex-row align-items-center">
                                <div>
                                  <img
                                    src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img2.webp"
                                    class="img-fluid rounded-3"
                                    alt="Shopping item"
                                    style="width: 65px"
                                  />
                                </div>
                                <div class="ms-3">
                                  <h5>Samsung galaxy Note 10</h5>
                                  <p class="small mb-0">256GB, Navy Blue</p>
                                </div>
                              </div>
                              <div class="d-flex flex-row align-items-center">
                                <div style="width: 50px">
                                  <h5 class="fw-normal mb-0">2</h5>
                                </div>
                                <div style="width: 80px">
                                  <h5 class="mb-0">$900</h5>
                                </div>
                                <a href="#!" style="color: #cecece"
                                  ><i class="fas fa-trash-alt"></i
                                ></a>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div class="card mb-3">
                          <div class="card-body">
                            <div class="d-flex justify-content-between">
                              <div class="d-flex flex-row align-items-center">
                                <div>
                                  <img
                                    src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img3.webp"
                                    class="img-fluid rounded-3"
                                    alt="Shopping item"
                                    style="width: 65px"
                                  />
                                </div>
                                <div class="ms-3">
                                  <h5>Canon EOS M50</h5>
                                  <p class="small mb-0">Onyx Black</p>
                                </div>
                              </div>
                              <div class="d-flex flex-row align-items-center">
                                <div style="width: 50px">
                                  <h5 class="fw-normal mb-0">1</h5>
                                </div>
                                <div style="width: 80px">
                                  <h5 class="mb-0">$1199</h5>
                                </div>
                                <a href="#!" style="color: #cecece"
                                  ><i class="fas fa-trash-alt"></i
                                ></a>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div class="card mb-3 mb-lg-0">
                          <div class="card-body">
                            <div class="d-flex justify-content-between">
                              <div class="d-flex flex-row align-items-center">
                                <div>
                                  <img
                                    src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img4.webp"
                                    class="img-fluid rounded-3"
                                    alt="Shopping item"
                                    style="width: 65px"
                                  />
                                </div>
                                <div class="ms-3">
                                  <h5>MacBook Pro</h5>
                                  <p class="small mb-0">1TB, Graphite</p>
                                </div>
                              </div>
                              <div class="d-flex flex-row align-items-center">
                                <div style="width: 50px">
                                  <h5 class="fw-normal mb-0">1</h5>
                                </div>
                                <div style="width: 80px">
                                  <h5 class="mb-0">$1799</h5>
                                </div>
                                <a href="#!" style="color: #cecece"
                                  ><i class="fas fa-trash-alt"></i
                                ></a>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div class="card mb-3 mt-3">
                          <div class="card-body">
                            <div class="d-flex justify-content-between">
                              <div class="d-flex flex-row align-items-center">
                                <div>
                                  <p class="h1">Toplam:</p>
                                </div>
                              </div>
                              <div class="d-flex flex-row align-items-center">
                                <div style="width: 50px">
                                  <h5 class="fw-normal mb-0 text-center px-2">6</h5>
                                </div>
                                <div style="width: 80px">
                                  <h5 class="mb-0">$900</h5>
                                </div>
                                <a href="#!" style="color: #cecece"
                                  ><i class="fas fa-trash-alt"></i
                                ></a>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="text-center"><button type="submit" class="btn btn-success" onclick="purchase()">Satın Al</button></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
      
    </div>
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
      function purchase() {
        alert('Alışveriş tamamlandı!');
      }
    </script>
  </body>
</html>
