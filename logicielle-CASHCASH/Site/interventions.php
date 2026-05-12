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
  <link rel="stylesheet" type="text/css" href="Client.css">
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
  <script>
const input = document.querySelector('#search-input');
const resultsList = document.querySelector('#results-list');
let toutesLesInterventions = [];

fetch('rechercheIntervention.php')
  .then(response => response.json())
  .then(data => {
    toutesLesInterventions = data;
    console.log(toutesLesInterventions)
    console.log("Données chargées :", toutesLesInterventions.length, "interventions");
  })
  .catch(error => console.error("Erreur de chargement :", error));

input.addEventListener('input', (e) => {
  const query = e.target.value.toLowerCase();
  resultsList.innerHTML = "";

  if (query.length > 0) {
    const configChamps = [
      { label: "id_Intervention", key: "id_Intervention" },
      { label: "Date", key: "Date_" },
      { label: "Num CLient", key: "NumClient" },
      { label: "Matricule", key: "Matricule" }
    ];

    // On utilise un objet pour stocker les correspondances uniques
    // Format : { "Nom Affiché": "cle_technique" }
    const correspondances = {};

    toutesLesInterventions.forEach(intervention => {
      configChamps.forEach(champ => {
        const valeur = String(intervention[champ.key] || "").toLowerCase();
        
        if (valeur !== "0" && valeur.includes(query)) {
          // On ajoute au dictionnaire : le label est la clé pour l'unicité
          correspondances[champ.label] = champ.key;
        }
      });
    });

    // On boucle sur les clés de notre dictionnaire (les labels)
    Object.keys(correspondances).forEach(label => {
      const cleTechnique = correspondances[label];
      
      const item = document.createElement('div');
      item.classList.add('result-item');
      item.textContent = label; // Affiche "Numéros Clients"
      
      item.onclick = () => {
        // Envoie "NumClient" et la saisie à la fonction
        maFonctionDeRecherche(cleTechnique, query);
      };
      
      resultsList.appendChild(item);
    });

    resultsList.classList.toggle('results-hidden', Object.keys(correspondances).length === 0);
  } else {
    resultsList.classList.add('results-hidden');
  }
});

function maFonctionDeRecherche(type, valeur) {
  console.log("Exécution de la recherche pour le champ technique : " + type);
  
  // Correction de l'URL pour qu'elle soit propre (format standard ?type=val&nom=val)
  // J'ai remplacé la virgule par un '&' qui est le séparateur standard d'URL
  window.location.href = "interventions.php?type=" + encodeURIComponent(type) + "&valeur=" + encodeURIComponent(valeur);
}



  </script>


<script>
document.getElementById("btnNouvelleIntervention").addEventListener("click", function() {
    // Redirection vers EditIntervention.php?id=
    window.location.href = "EditIntervention.php?id=";
});
</script>
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
      
              $id = $ligne['id_Intervention'];
      
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
    <script>
document.querySelectorAll('.ligne-clickable').forEach(function(row) {
    row.addEventListener('click', function() {
        const id = this.getAttribute('data-id');
        window.location.href = 'EditIntervention.php?id=' + id;
    });
});
document.querySelectorAll('.ligne-clickable-Client').forEach(function(row) {
    row.addEventListener('click', function() {
        const id = this.getAttribute('data-id');
        window.location.href = 'EditClient.php?id=' + id;
    });
});
</script>
</body>
</html>
