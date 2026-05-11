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

  
  <script>
const input = document.querySelector('#search-input');
const resultsList = document.querySelector('#results-list');
let tousLesClients = [];

fetch('recherche.php')
  .then(response => response.json())
  .then(data => {
    tousLesClients = data;
    console.log("Données chargées :", tousLesClients.length, "clients");
  })
  .catch(error => console.error("Erreur de chargement :", error));

input.addEventListener('input', (e) => {
  const query = e.target.value.toLowerCase();
  resultsList.innerHTML = "";

  if (query.length > 0) {
    const configChamps = [
      { label: "Raisons Sociales", key: "RaisonSociale" },
      { label: "Adresses Postales", key: "AdressePostale" },
      { label: "Numéros de Téléphone", key: "NumTel" },
      { label: "Emails", key: "Email" },
      { label: "Numéros Clients", key: "NumClient" },
      { label: "Distances Agences", key: "DistanceAgenceKm" }
    ];

    // On utilise un objet pour stocker les correspondances uniques
    // Format : { "Nom Affiché": "cle_technique" }
    const correspondances = {};

    tousLesClients.forEach(client => {
      configChamps.forEach(champ => {
        const valeur = String(client[champ.key] || "").toLowerCase();
        
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
  window.location.href = "clients.php?type=" + encodeURIComponent(type) + "&valeur=" + encodeURIComponent(valeur);
}



  </script>

<script>
document.getElementById("btnNouvelleIntervention").addEventListener("click", function() {
    // Redirection vers EditIntervention.php?id=
    window.location.href = "EditClient.php?id=";
});
</script></div>
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
