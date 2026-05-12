document.addEventListener("click", function (e) {
    if (e.target.classList.contains("btnSupprimer")) {

        const bouton = e.target;
        const numSerie = bouton.dataset.numserie;

        // Ajouter un input caché pour le POST (pour pouvoir supprimer pluseurs valeur quand on clique sur enregistrer)
        const input = document.createElement("input");
        input.type = "hidden";
        input.name = "supprimer[]";
        input.value = numSerie;

        document.getElementById("zoneSuppressions").appendChild(input);

        // Supprimer la ligne visuellement
        bouton.closest("tr").remove();
    }
});

let indexAjout = 0;

document.getElementById("btnAjouter").addEventListener("click", function () {

    const tbody = document.querySelector(".odoo-table tbody");

    const ligne = document.createElement("tr");

    ligne.innerHTML = `
    <tr>
        <td>
            <select class="selectMateriel" name="ajouts[${indexAjout}][numSerie]" required>
                <option value="">-- Sélectionner --
                </option>
                <?php foreach ($tousMateriels as $m): ?>
                    <option value="<?= $m['NumSerie'] ?>" 
                    data-libelle="<?= htmlspecialchars($m['Libellé']) ?>"
                    data-emplacement="<?= htmlspecialchars($m['Emplacement']) ?>">
                        #<?= $m['NumSerie'] ?> – <?= addslashes($m['Libellé']) ?>
                    </option>
                <?php endforeach; ?>
                </select>

            </td>

            <!-- TYPE (NON MODIFIABLE) -->
            <td class="typeMateriel">
                <?= !empty($mat['Libellé']) ? htmlspecialchars($mat['Libellé']) : '' ?>
            </td>

            <!-- EMPLACEMENT (MODIFIABLE) -->
            <td>
                <input type="text"
                    class="emplacementMateriel"
                    name="materiel[<?= $mat['NumSerie'] ?>][emplacement]"
                    value="<?= !empty($mat['Emplacement']) ? htmlspecialchars($mat['Emplacement']) : '' ?>">
            </td>

            <!-- TEMPS -->
            <td> <input type="time" name="ajouts[${indexAjout}][temps]" value="00:15" required> </td>

        <td>
            <button type="button" class="btnSupprimerLigne">❌</button>
        </td>
        </tr>
    `;

    tbody.appendChild(ligne);
    indexAjout++;
});

// suppression visuelle si erreur
document.addEventListener("click", function (e) {
    if (e.target.classList.contains("btnSupprimerLigne")) {
        e.target.closest("tr").remove();
    }
});
    // MET A JOUR LES DONNEES LORS DU CHANHEMENT D'APPAREIL
    document.querySelector(".odoo-table tbody").addEventListener("change", function(e){
    if (e.target.classList.contains("selectMateriel")) {
        const select = e.target; // <- c'est le select réel
        const option = select.options[select.selectedIndex]; // ✅ maintenant ça marche
        const libelle = option.getAttribute("data-libelle");
        const emplacement = option.getAttribute("data-emplacement");
        const ligne = select.closest("tr");

        const celluleType = ligne.querySelector(".typeMateriel");
        if(celluleType) celluleType.textContent = libelle;

        const celluleEmplacement = ligne.querySelector(".emplacementMateriel");
        if(celluleEmplacement) celluleEmplacement.value = emplacement;
    }
});


// MET A JOUR LES DONNEES LORS DU CHANHEMENT DE CLIENT
document.querySelectorAll(".selectClient").forEach(function(select){

select.addEventListener("change", function(){

    const option = this.options[this.selectedIndex];

    const adressepostale = option.getAttribute("data-adressepostale");
    const distanceAgence = option.getAttribute("data-distanceagence");
    const TelClient = option.getAttribute("data-telclient");
    const EmailClient = option.getAttribute("data-emailclient");
    const NumClient = option.getAttribute("data-numclient");

    const container = document;

    const celluleadressepostale = container.querySelector(".adressepostale");
    const celluledistanceAgence = container.querySelector(".distanceAgence");
    const celluleTelClient = container.querySelector(".TelClient");
    const celluleEmailClient = container.querySelector(".EmailClient");
    const celluleNumClient = container.querySelector(".numclient");
    

    if (celluleadressepostale)
        celluleadressepostale.textContent = "Adresse : " + adressepostale;

    if (celluledistanceAgence)
        celluledistanceAgence.textContent = "Distance de l'agence : " + distanceAgence + " Km";

    if (celluleTelClient)
        celluleTelClient.textContent = "📞 " + TelClient;

    if (celluleEmailClient)
        celluleEmailClient.textContent = "✉️ " + EmailClient;

    if (celluleNumClient)
        celluleNumClient.textContent = "Numero client : " + NumClient;

});

});



document.querySelectorAll(".selectTechnicien").forEach(function(select){

select.addEventListener("change", function(){

    const option = this.options[this.selectedIndex];

    const nomagence = option.getAttribute("data-nomagence");
    const matricule = option.getAttribute("data-matricule");
    const qualification = option.getAttribute("data-qualification");
    const EmailClient = option.getAttribute("data-emailtech");
    const NumClient = option.getAttribute("data-numteltech");

    const container = document;

    const celluleNomAgence = container.querySelector(".nomagence");
    const cellulematricule = container.querySelector(".matricule");
    const cellulequalification = container.querySelector(".qualification");
    const celluleEmailTech = container.querySelector(".emailtech");
    const celluleNumTech = container.querySelector(".numtech");
    

    if (celluleNomAgence)
        celluleNomAgence.textContent = "Agence : " + nomagence;

    if (cellulematricule)
        cellulematricule.textContent = "Matricule : " + matricule;

    if (cellulequalification)
        cellulequalification.textContent = "Qualification : " + qualification;

    if (celluleEmailTech)
        celluleEmailTech.textContent = "✉️ " + EmailClient;

    if (celluleNumTech)
        celluleNumTech.textContent = "📞 " + NumClient;

});

});
