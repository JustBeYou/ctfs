<?php

if(!defined('SCRIPT'))die();
?>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ScreenBag</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  </head>

  <body>

    

    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading -->
      <br>
      <br>

      <div class="text-center">
        <div class="row">
          <div class="col-xl-9 mx-auto">
              <h2 class="mb-2">ScreenBag(📺 👜)<br>Online bag for your website screenshots<br> include ma<span style="display: none">o</span>nual health check!<br>Max secure! Privacy so so ! Very private🐕<br> All free!!!!</h2>
          </div>

          <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
              <?php if (isset($message)){
                  ?>
                  <div class="alert alert-warning" role="alert"><?=$message?></div>
                  <?php
              }
              ?>
              <form class="form" role="form" autocomplete="off" id="loginForm" method="GET">
                  <div class="form-group">
                      <label for="username">Username</label>
                      <input type="text" class="form-control" name="username" id="username" required="">
                  </div>
                  <div class="form-group">

                      <label>Captcha</label>
                      <div class="row">
                          <div class="col-md-4">
                              <img class="form-control form-control-sm" src="captcha.php">
                          </div>
                          <div class="col-md-4">
                              <input type="text" class="form-control h-100" name="ct" id="ct" required="">
                          </div>
                          <div class="col-md-4">
                              <button type="submit" class="btn btn-primary btn-lg float-right h-100" id="btnLogin">Create Bag</button>
                          </div>
                      </div>

                  </div>

              </form>
          </div>
        </div>
      </div>
      <br>
      <br>
      
      <br>
      <div class="row">
        
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="img/home.png" alt=""></a>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="img/home.png" alt=""></a>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="img/home.png" alt=""></a>
          </div>
        </div>    
      </div>
      <!-- /.row -->
    </div>
    <!-- /.container -->


    <!-- Bootstrap core JavaScript -->
    <script src="assets/jquery/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
