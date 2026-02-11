<?php 
    $requete = 'clients';
    include_once '../Backend/api.php' ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
  <title>PrestInfo </title>
  <meta charset="utf-8">
  <link rel="stylesheet" type="text/css" href="Client.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
</head>
<body>

    <!-- Haut de page -->
    <header>
        
        <img class="logo" src="Image/logo.jpg" width="100">
        <!-- Menu de naviguation  -->
     <nav>
             <li> <a href="index.html">Accueil</a></li>
             <li> <a href="Actualité.html">Actualité</a></li>
             <li> <a href="contact.html">Contact</a></li>
             <li> <a href="clients.php"> Clients</a></li>
             <li> <a href="statistiques.php">Statistiques</a></li>
     </nav>
    </header>
    
 

    <div class="blockFormulaire">
  <div class="Formulaire">
    <div class="table-wrapper">
      <?= api($requete); ?>
    </div>
    </div>
    </div>

</body>
</html>


    <!-- Pied de page -->
    <footer>
        <p>
            Copiright &copy; PrestInfo 2024/2025 ALL RIGHT RESERVED
        </p>
    </footer>
</body>
</html>