<?php 
include_once __DIR__ . '/modeles/mesFonctionsAccesDonnes.php';

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    $id = 0;
}

$id = (int)$_GET['id'];

/* ENREGISTREMENT */
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    if (isset($_POST['RaisonSociale']) && $_POST['RaisonSociale'] !== '') {
        updateClientField($id, 'RaisonSociale', $_POST['RaisonSociale']);
    }
    
    if (isset($_POST['SIREN']) && $_POST['SIREN'] !== '') {
        updateClientField($id, 'SIREN', $_POST['SIREN']);
    }
    
    if (isset($_POST['CodeApe']) && $_POST['CodeApe'] !== '') {
        updateClientField($id, 'CodeApe', $_POST['CodeApe']);
    }
    
    if (isset($_POST['NumTelecopie']) && $_POST['NumTelecopie'] !== '') {
        updateClientField($id, 'NumTelecopie', $_POST['NumTelecopie']);
    }
    
    if (isset($_POST['NumTel']) && $_POST['NumTel'] !== '') {
        updateClientField($id, 'NumTel', $_POST['NumTel']);
    }
    
    if (isset($_POST['Email']) && $_POST['Email'] !== '') {
        updateClientField($id, 'Email', $_POST['Email']);
    }
    
    if (isset($_POST['Nom']) && $_POST['Nom'] !== '') {
        updateAgenceField($id, 'Nom', $_POST['Nom']);
    }
    
    if (isset($_POST['DistanceAgenceKm']) && $_POST['DistanceAgenceKm'] !== '') {
        updateClientField($id, 'DistanceAgenceKm', $_POST['DistanceAgenceKm']);
    }
    
    if (isset($_POST['DuréeDeplacement']) && $_POST['DuréeDeplacement'] !== '') {
        updateClientField($id, 'DuréeDeplacement', $_POST['DuréeDeplacement']);
    }
    
    if (isset($_POST['AdressePostale']) && $_POST['AdressePostale'] !== '') {
        updateClientField($id, 'AdressePostale', $_POST['AdressePostale']);
    }
}
    

/* AFFICHAGE */
if ($id !=0){
$infoClient = getInfoCLient($id);
$interventionDuClient = getInterventionDuClient($id);
}

else{
    $infoClient = [
        "Id_in$infoClient" => "New",
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



if (!$infoClient) {
    die("Client introuvable");
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="EditIntervention.css">
<title>Client</title>


</head>

<body>
<header>
        
        <img class="logo" src="Image/logoCashCash2.PNG" width="100">
        <!-- Menu de naviguation  -->
     <nav>
         <ul>
             <li> <a href="">Accueil</a></li>
             <li> <a href="Actualité.html">Actualité</a></li>
             <li> <a href="contact.html">Contact</a></li>
         </ul>
     </nav>
        <nav>
            <ul>
                <li>
                <a href="Connexion.html" class="Connexion"> Connexion</a></li>
                </li>
            </ul>
        </nav>
    </header>

<div class="container">

<form method="post">
    <div id="zoneSuppressions"></div>

    <div class="header">
        <h1>Client #<?= $infoClient['NumClient'] ?></h1>
        <button type="submit">Enregistrer</button>
    </div>

    
    <div class="odoo-box">

    <div class="box-left">
    <input class="input-odoo-titre" type="text" name="RaisonSociale"
       value="<?= htmlspecialchars($infoClient['RaisonSociale']) ?>"></br></br>
<txt>SIREN :</txt>
<input class="input-odoo" type="text" name="SIREN"
       value="<?= htmlspecialchars($infoClient['SIREN']) ?>"></br>
       <txt>Code APE : </txt>
<input class="input-odoo" type="text" name="CodeApe"
       value="<?= htmlspecialchars($infoClient['CodeApe']) ?>"></br>
       <txt>Num telecopie : </txt>
<input class="input-odoo" type="text" name="NumTelecopie"
       value="<?= htmlspecialchars($infoClient['NumTelecopie']) ?>"></br>
       <txt>📞 </txt>
<input class="input-odoo" type="text" name="NumTel"
       value="<?= htmlspecialchars($infoClient['NumTel']) ?>"></br>
       
       <txt>✉️ </txt>
<input class="input-odoo" type="email" name="Email"
       value="<?= htmlspecialchars($infoClient['Email']) ?>"></br>
    </div>

    <div class="box-right">
    
    <input class="input-odoo-titre" type="text" name="Nom"
       value="<?= htmlspecialchars($infoClient['Nom']) ?>"></br></br>
       <txt>Distance de l'agence : </txt>
<input class="input-odoo" type="text" name="DistanceAgenceKm"
       value="<?= htmlspecialchars($infoClient['DistanceAgenceKm']) ?>"></br>
       <txt>Durée de deplacement : </txt>
<input class="input-odoo" type="text" name="DuréeDeplacement"
       value="<?= htmlspecialchars($infoClient['DuréeDeplacement']) ?>"></br>
       <txt>Adresse : </txt>
<input class="input-odoo" type="text" name="AdressePostale"
       value="<?= htmlspecialchars($infoClient['AdressePostale']) ?>">
    </div>

</div>

    
    <h2>Intervention </h2>
    <table class="odoo-table">
        
        <thead>
            <tr>
                <th>Intervention</th>
                <th>Date</th>
                <th>Technicien</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($interventionDuClient as $intervention): ?>
                <tr>
    <!-- CHANGER LE MATÉRIEL -->
    <td>
    <div><?= $intervention['Id_Intervention'] ?></div>
    </td>

    <!-- TYPE (NON MODIFIABLE) -->
    <td><div><?= $intervention['Date_'] ?></div></td>

    <!-- EMPLACEMENT (MODIFIABLE) -->
    <td>
    <div><?= $intervention['Nom'] ?></div>
    <div><?= $intervention['Prenom'] ?></div>
    </td>
    
</tr>


            <?php endforeach; ?>
        </tbody>

    </table>



</form>

</div>

</body>
</html>