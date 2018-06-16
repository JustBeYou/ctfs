<?php
    session_start();
    if(isset($_COOKIE['userinfo'])){
        header("Location: quiz.php");
        die();
    }
    if(isset($_POST['username'])&&isset($_POST['email'])){

        $user = array();
        $user['username'] = (string) $_POST['username'];
        $user['email'] = (string) $_POST['email'];

        setcookie("userinfo", base64_encode(serialize($user)), time() + (86400 * 30), "/");
        setcookie("quiz_no", 0, time() + (86400 * 30), "/");

        header("Location: quiz.php");
        die();
    }
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>420 Quiz</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <style>
      body {
        padding-top: 54px;
      }
      @media (min-width: 992px) {
        body {
          padding-top: 56px;
        }
      }

    </style>

  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">420 Quiz</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="index.php">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h1 class="mt-5">Ready for the quiz!</h1>
                <p class="lead">Answer these quizs and get award!</p>
                <form action="index.php" method="POST">
                    <div class="form-row">
                        <div class="col-12 col-md-10 mb-2 mb-md-0 offset-1">
                            <input type="text" name="username" class="form-control form-control-lg" placeholder="Enter your username...">
                        </div>
                    </div><br/>
                    <div class="form-row">
                        <div class="col-12 col-md-10 mb-2 mb-md-0 offset-1">
                            <input type="email" name="email" class="form-control form-control-lg" placeholder="Enter your email...">
                        </div>
                    </div><br/>
                    <div class="form-row">
                        <div class="col-12 col-md-4 offset-4">
                            <input type="submit" name="submit" class="btn btn-block btn-lg btn-primary" value="Next"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
