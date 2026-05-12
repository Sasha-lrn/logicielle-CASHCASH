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
        
        <img class="logo" src="Image/logoIntervention.png" width="100">
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
  <button type="button" id="btnNouvelleIntervention">Nouvelle intervention</button>

    <div class="table-wrapper">

<?php 

      echo "<h2>Table : Interventions</h2>";
      if (!empty($_GET['type']) && !empty($_GET['valeur'])) {
        $resultat2 = getInterventionsRecherche($_GET['type'], $_GET['valeur']);
      }
      else{
        $resultat2 = getTousLesInterventions();
      }
      
      if ($resultat2 && count($resultat2) > 0) {
          echo "<table>";
      
          // Colonnes
          echo "<tr>";
          foreach (array_keys($resultat2[0]) as $colonne) {
              echo "<th>" . htmlspecialchars($colonne) . "</th>";
          }
          echo "</tr>";
      
          // Données
          foreach ($resultat2 as $ligne) {
              if (!isset ($ligne['id_Intervention'])){
                $id = $ligne['Id_Intervention'];
              }
              else{
                $id = $ligne['id_Intervention'];
              }
      
              echo '<tr class="ligne-clickable" data-id="' . htmlspecialchars($id) . '">';
      
              foreach ($ligne as $valeur) {
                  echo "<td>" . htmlspecialchars($valeur) . "</td>";
              }
      
              echo "</tr>";
          }
      
          echo "</table>";
      
      } else {
          echo "<p>Aucune donnée trouvée dans la table interventions.</p>";
      }
      ?>

    </div>
    </div>
    </div>
<script src = "js/interventions.js"></script>
</body>
</html>
