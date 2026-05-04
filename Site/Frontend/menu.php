<?php
session_start();

if (!isset($_SESSION['user'])) {
    header("Location: index.html");
    exit();
}
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
  <title>PrestInfo </title>
  <meta charset="utf-8">
  <link rel="stylesheet" type="text/css" href="menu.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
</head>
<body>
    <div>
    <img class="imageaccueil" src="Image/fondMenu.jpg" >
    <a href= interventions.php><img class = "imageMenu" src="Image/logoIntervention.png" width = "150"></a>
    <a href= clients.php><img class = "imageMenu" src="Image/logoClient.png" width = "150"></a>
    <a href= statistiques.php><img class = "imageMenu" src="Image/logoStatistique.png" width = "150"></a>
    <a href= deconnexion.php><img class = "imageMenu" src="Image/logoAccueil.png" width = "150"></a>
    </div>

    
</body>
</html> 