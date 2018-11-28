<?php

if(!defined('SCRIPT'))die();

$message = null;
$links = array();
function process(&$message, &$links, $user){
    if (!isset($_GET['ct']) or !isset($_SESSION['phrase']))
        return false;
    if ($_SESSION['phrase']!==$_GET['ct']){
        $message = "Wrong captcha.";
        return false;
    }
    if (!isset($_GET['url']))
        return false;
    else if ( !isValidURL($_GET['url'])){
        $message = "Invalid url";
        return false;
    }


    $url = $_GET['url'];
    cache($url, $user);

}

process($message, $links, $user);
$links = getCache($user);
?>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>New screenshot</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-light">
      <div class="container">
        <a class="navbar-brand" href="#"></a>
        <a class="btn btn-danger" href="index.php?destroy">Destroy <strong><?=htmlspecialchars($user->metadata['username'])?></strong></a>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">
      <br>
      <br>

      <div class="">

        <div class="row">

          <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
              <?php if (isset($message)){
                  ?>
                  <div class="alert alert-warning" role="alert"><?=$message?></div>
                  <?php
              }
              ?>
            <form class="form" role="form" autocomplete="off" id="loginForm" method="GET">
                <div class="form-group">
                    <label for="url">URL</label>
                    <input type="text" class="form-control" name="url" id="url" required="" placeholder="http://p0r...">
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
                            <button type="submit" class="btn btn-primary btn-lg float-right h-100" id="btnLogin">PrntScrn</button>
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
        <?php
        foreach($links as $k => $v){
        ?>

            <div class="col-lg-4 col-sm-6 portfolio-item">
                <div class="card h-100" style="max-width: 400px; align-items: center">
                    <a href="<?=htmlspecialchars($v['url'])?>"><img class="card-img-top" src="<?=$v['path']?>" alt=""></a>
                </div>
            </div>
            <?php
            }
          ?>
        </div>
      <!-- /.row -->
    </div>
    <!-- /.container -->


    <!-- Bootstrap core JavaScript -->
    <script src="assets/jquery/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
