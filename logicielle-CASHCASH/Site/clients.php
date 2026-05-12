<?php
session_start();

if (!isset($_SESSION['login'])) {
    header("Location: index.html");
    exit();
}
?>

<?php 
include_once __DIR__.'/modeles/mesFonctionsAccesDonnes.php' ?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
  <title>CashCash </title>
  <meta charset="utf-8">
  <link rel="stylesheet" type="text/css" href="css/Client.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
</head>
<body>

    <!-- Haut de page -->
    <header>
        
        <img class="logo" src="Image/logoClient.png" width="100">
        <!-- Menu de naviguation  -->
     <nav>
         <ul>
             <li> <a href="menu.php">Menu</a></li>
         </ul>
     </nav>
    </header>
    
 

    <div class="blockFormulaire">
  <div class="Formulaire">
  <div class="search-wrapper">
  <form class="search-container">
    <input type="text" id="search-input" placeholder="Rechercher..." autocomplete="off">
  </form>
  <!-- La liste qui apparaîtra dynamiquement -->
  <div id="results-list" class="results-hidden"></div>
</div>
  
</form>
  <button type="button" id="btnNouvelleIntervention">Nouveau client</button>

</div>
    <div class="table-wrapper">
      <?php 
         
       
        echo "<h2>Table : Clients</h2>";
        if (!empty($_GET['type']) && !empty($_GET['valeur'])) {
            $resultat1 = getClientsRecherche($_GET['type'], $_GET['valeur']);
        } else {
            $resultat1 = getTousLesClients();
        }
        if ($resultat1 && count($resultat1) > 0) {
            echo "<table>";
        
            // Colonnes (à partir de la première ligne)
            echo "<tr>";
            foreach (array_keys($resultat1[0]) as $colonne) {
                echo "<th>" . htmlspecialchars($colonne) . "</th>";
            }
            echo "</tr>";
        
            // Données
            foreach ($resultat1 as $ligne) {
                $id = $ligne['NumClient'];
                echo '<tr class="ligne-clickable-Client" data-id="' . htmlspecialchars($id) . '">';

                foreach ($ligne as $valeur) {
                    echo "<td>" . htmlspecialchars($valeur) . "</td>";
                }

                echo "</tr>";
            }
        
            echo "</table>";
        } else {
            echo "<p>Aucune donnée trouvée dans la table clients.</p>";
        }
?>
    </div>
    </div>
    </div>
    <script src = "js/clients.js"></script>
</body>
</html>
