<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <title>Collider</title>
<!-- My source is at /src.tgz -->
    <style>
html {
  position: relative;
  min-height: 100%;
}

body {
  padding-top: 5rem;
  margin-bottom: 60px; /* Margin bottom by footer height */
}
.starter-template {
  padding: 3rem 1.5rem;
  text-align: center;
}
.footer {
  position: absolute;
  bottom: 0;
  width: 100%;
  height: 60px; /* Set the fixed height of the footer here */
  line-height: 60px; /* Vertically center the text there */
  background-color: #f5f5f5;
}
    </style>
</head>
    <body>

    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
      <a class="navbar-brand" href="/">Collider</a>
    </nav>

    <main role="main" class="container">

      <div class="starter-template">
        <h1>Collider</h1>
        <p class="lead">Your task is pretty simple: Upload two PDF files. The first should contain the string "NO FLAG!" and the other one "GIVE FLAG!", but both should have the same MD5 hash!</p>
      </div>
      <div class="container">
        <form method="post" enctype="multipart/form-data">
	      <input type="file" name="pdf1" id="pdf1">
	      <input type="file" name="pdf2" id="pdf2">
              <button type="submit" class="btn btn-primary" name="submit" value="submit">Upload!</button>
        </form>
      </div>

<?php
    include_once "config.php";
    if(isset($_POST['submit']))  {
            $pdf1 = $_FILES['pdf1']['tmp_name'];
            $pdf2 = $_FILES['pdf2']['tmp_name'];

            if(! strstr(shell_exec("pdftotext $pdf1 - | head -n 1 | grep -oP '^NO FLAG!$'"), "NO FLAG!")) {
                die("The first pdf does not contain 'NO FLAG!'");
            }

            if(! strstr(shell_exec("pdftotext $pdf2 - | head -n 1 | grep -oP '^GIVE FLAG!$'"), "GIVE FLAG!")) {
                die("The second pdf does not contain 'GIVE FLAG!'");
            }

            if(md5_file($pdf1) != md5_file($pdf2)) {
                die("The MD5 hashes do not match!");
            }

            echo "$FLAG";

    }
?>
    </main>

<footer class="footer">
      <div class="container">
        <span class="text-muted">With love from <a href="https://twitter.com/gehaxelt">@gehaxelt</a> for the 35C3 Junior CTF and ESPR :-)</span>
      </div>
</footer>


        <script src="/assets/js/jquery-3.3.1.slim.min.js"></script>
        <script src="/assets/js/popper.min.js"></script>
        <script src="/assets/js/bootstrap.min.js"></script>
    </body>
</html>
