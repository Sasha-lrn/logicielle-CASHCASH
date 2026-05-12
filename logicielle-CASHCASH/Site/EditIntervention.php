<?php
session_start();

if (!isset($_SESSION['login'])) {
    header("Location: index.html");
    exit();
}
?>


<?php
include_once __DIR__ . '/modeles/mesFonctionsAccesDonnes.php';

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    $idIntervention = 0;
}

$idIntervention = (int)$_GET['id'];

/* ENREGISTREMENT */
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    /* MAJ intervention */
    if ($idIntervention == 0) {

        if (!empty($_POST['client']) && !empty($_POST['technicien'])) {

            $idIntervention = createIntervention(
                $_POST['date_intervention'],
                (int)$_POST['client'],
                (int)$_POST['technicien']
            );

        } else {
            die("Client et technicien obligatoires pour créer une intervention");
        }

    } else {
        // 🔧 CAS MODIFICATION
        updateIntervention($idIntervention, $_POST['date_intervention'], $_POST['client']);
    }
    /* MAJ temps existants */
    if (!empty($_POST['temps'])) {
        foreach ($_POST['temps'] as $numSerie => $temps) {
            updateTempsMateriel($idIntervention, (int)$numSerie, $temps);
        }
    }
    if (!empty($_POST['client'])) {
        updateClientIntervention($idIntervention, (int)$_POST['client']);
    }
    if (!empty($_POST['technicien'])) {
        updateTechnicienIntervention($idIntervention, (int)$_POST['technicien']);
    }

    /* SUPPRESSION matériel */
    if (!empty($_POST['supprimer'])) {
        foreach ($_POST['supprimer'] as $numSerie) {
            supprimerMaterielIntervention($idIntervention, (int)$numSerie);
        }
    }

    /* AJOUT matériel */
    if (!empty($_POST['ajouts'])) {
        foreach ($_POST['ajouts'] as $ajouts){
        ajouterMaterielIntervention(
            $idIntervention,
            $ajouts['numSerie'],
            $ajouts['temps']
        );
    }
    }
    if (!empty($_POST['materiel'])) {
        foreach ($_POST['materiel'] as $ancienNumSerie => $data) {
    
            $nouveauNumSerie = (int)$data['nouveau_numSerie'];
            $emplacement = $data['emplacement'];
            $temps = $data['temps'];
    
            /* 1️⃣ Changement d’appareil */
            if ($nouveauNumSerie !== (int)$ancienNumSerie) {
    
                // supprimer ancien lien
                supprimerMaterielIntervention($idIntervention, (int)$ancienNumSerie);
    
                // ajouter nouveau lien
                ajouterMaterielIntervention(
                    $idIntervention,
                    $nouveauNumSerie,
                    $temps
                );
            } else {
                // mise à jour temps
                updateTempsMateriel(
                    $idIntervention,
                    (int)$ancienNumSerie,
                    $temps
                );
            }
    
            /* 2️⃣ Mise à jour emplacement */
            updateEmplacementMateriel($nouveauNumSerie, $emplacement);
        }
    
    }
    header("Location: EditIntervention.php?id=".$idIntervention);
    exit;
}


/* AFFICHAGE */
if ($idIntervention !=0){
$intervention = getInterventionComplete($idIntervention);
$materiels = getMaterielsByIntervention($idIntervention);}
else{
    $intervention = [
        "Id_Intervention" => "New",
        "Date_" => null,
    
        "RaisonSociale" => null,
        "AdressePostale" => null,
        "NumTel" => null,
        "Email" => null,
        "NumClient" => null,
        "DistanceAgenceKm" => null,
    
        "matricule" => null,
        "NomTech" => null,
        "PrenomTech" => null,
        "Qualification" => null,
        "EmailTech" => null,
        "NomAgence" => null,
        "NumTelTech" => null
    ];
    $materiels = [];
}
$tousMateriels = getTousLesMateriels();
$clients = getTousLesClients();
$techniciens = getTousLesTechniciens();

if (!$intervention) {
    die("Intervention introuvable");
}
//---------------------------------------------------------------------------------------//
//                                        PAGE
//---------------------------------------------------------------------------------------//
?>




<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/EditIntervention.css">
<title class="no-print">Modifier intervention</title>


</head>

<body>
<header>
        
        <img class="logo" src="Image/logoIntervention.png" width="100">
        <!-- Menu de naviguation  -->
     <nav>
         <ul>
            <li> <a href="interventions.php">Interventions</a></li>
             <li> <a href="menu.php">Menu</a></li>
         </ul>
     </nav>
    </header>

<div class="container">

<form method="post">
    <div id="zoneSuppressions"></div>

    <div class="header">
        <h1>Intervention #<?= $intervention['Id_Intervention'] ?></h1>
        <div>
        
        <button onclick="imprimer()">Imprimer</button>
        <button type="submit">Enregistrer</button>
</div>
        <script>function imprimer() {
  window.print();}</script>

    </div>

    
    <div class="odoo-box">

    <div class="box-left">
    <h3>Client</h3><div>
    <select name="client" class="selectClient">
    if {$intervention = 0}{
        <option value="" selected></option>
    }
<?php foreach ($clients as $client): ?>
    <option value="<?= $client['NumClient'] ?>"
            data-adressepostale="<?= htmlspecialchars($client['AdressePostale']) ?>"
            data-distanceagence="<?= htmlspecialchars($client['DistanceAgenceKm']) ?>"
            data-telclient="<?= htmlspecialchars($client['NumTel']) ?>"
            data-emailclient="<?= htmlspecialchars($client['Email']) ?>"
            data-numclient="<?= htmlspecialchars($client['NumClient']) ?>"
            <?= $client['NumClient'] == $intervention['NumClient'] ? 'selected' : '' ?>>
        <?= htmlspecialchars($client['RaisonSociale']) ?>
    </option>
<?php endforeach; ?>

</select>
                </div>
        <br>
        <div class="numclient">Numero client : <?= $intervention['NumClient'] ?><br></div>
        <div class="adressepostale">Adresse : <?= $intervention['AdressePostale'] ?><br></div>
        <div class="distanceAgence">Distance de l'agence : <?= $intervention['DistanceAgenceKm'] ?> Km<br></div>
        <div class="TelClient">📞 <?= $intervention['NumTel'] ?><br></div>
        <div class="EmailClient">✉️ <?= $intervention['Email'] ?></div>
    </div>

    <div class="box-right">
    <h3>Technicien</h3>
        <select name="technicien" class="selectTechnicien">
        if {$intervention = 0}{
        <option value="" selected></option>
    }
        <?php foreach ($techniciens as $technicien): ?>
            <option value="<?= $technicien['matricule'] ?>"
                    data-nomagence="<?= htmlspecialchars($technicien['NomAgence']) ?>"
                    data-matricule="<?= htmlspecialchars($technicien['matricule']) ?>"
                    data-qualification="<?= htmlspecialchars($technicien['Qualification']) ?>"
                    data-numteltech="<?= htmlspecialchars($technicien['NumTelTech']) ?>"
                    data-emailtech="<?= htmlspecialchars($technicien['EmailTech']) ?>"
                    <?= $technicien['matricule'] == $intervention['matricule'] ? 'selected' : '' ?>>
                    <?= htmlspecialchars($technicien['NomTech'] ." ". $technicien['PrenomTech']) ?>
            </option>
        <?php endforeach; ?>

        </select>
        <br><br>
        <div class="nomagence" >Agence : <?= $intervention['NomAgence'] ?><br></div>
        <div class="matricule" >Matricule : <?= $intervention['matricule'] ?><br></div>
        <div class="qualification" >Qualification : <?= $intervention['Qualification'] ?><br></div>
        <div class="numtech" >📞 <?= $intervention['NumTelTech'] ?><br></div>
        <div class="emailtech" >✉️ <?= $intervention['EmailTech'] ?></div>
    </div>

</div>

    <div class="form-grid">

        <div class="field">
            <label>Date d’intervention</label>
            <input type="datetime-local" name="date_intervention"
                value="<?= date('Y-m-d\TH:i', strtotime($intervention['Date_'])) ?>">
        </div>

    </div>
    
    <h2>Matériels</h2>
    <table class="odoo-table">
        
        <thead>
            <tr>
                <th>Numéro de série</th>
                <th>Type</th>
                <th>Emplacement</th>
                <th>Temps</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($materiels as $mat): ?>
                <tr>
    <!-- CHANGER LE MATÉRIEL -->
    <td>
    <select name="materiel[<?= $mat['NumSerie'] ?>][nouveau_numSerie]" 
        class="selectMateriel">

    <?php foreach ($tousMateriels as $m): ?>
        <option value="<?= $m['NumSerie'] ?>"
                data-libelle="<?= htmlspecialchars($m['Libellé']) ?>"
                data-emplacement="<?= htmlspecialchars($m['Emplacement']) ?>"
                <?= $m['NumSerie'] == $mat['NumSerie'] ? 'selected' : '' ?>>
            #<?= $m['NumSerie'] ?> – <?= htmlspecialchars($m['Libellé']) ?>
        </option>
    <?php endforeach; ?>

</select>

    </td>

    <!-- TYPE (NON MODIFIABLE) -->
    <td class="typeMateriel"><?= htmlspecialchars($mat['Libellé']) ?></td>

    <!-- EMPLACEMENT (MODIFIABLE) -->
    <td>
         <input type="text"
                class="emplacementMateriel"
               name="materiel[<?= $mat['NumSerie'] ?>][emplacement]"
               value="<?= htmlspecialchars($mat['Emplacement']) ?>">
    </td>

    <!-- TEMPS -->
    <td>
        <input type="time"
               name="materiel[<?= $mat['NumSerie'] ?>][temps]"
               value="<?= substr($mat['TempsIntervention'], 0, 5) ?>">
    </td>
    <td>
    <button name = "supprimer" class="btnSupprimer" data-numserie="<?= $mat['NumSerie'] ?>" >Supprimer</button>

    
    </td>
    
</tr>


            <?php endforeach; ?>
        </tbody>

    </table>

<button id="btnAjouter" class="btnAjouter" data-numserie="<?= $mat['NumSerie'] ?>" >Ajouter</button>

<script src = "js/EditIntervention.js"></script>
</form>

</div>

</body>
</html>