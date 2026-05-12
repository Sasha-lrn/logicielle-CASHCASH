// RECHERCHE INTERVENTION
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


document.getElementById("btnNouvelleIntervention").addEventListener("click", function() {
    // Redirection vers EditIntervention.php?id=
    window.location.href = "EditIntervention.php?id=";
});

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