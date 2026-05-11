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
    $id = 0;
}

$id = (int)$_GET['id'];

/* ENREGISTREMENT */

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    if ($id == 0) {

        if (!empty($_POST['RaisonSociale']) && !empty($_POST['Num_agence'])) {
            $id = createClient(
                $_POST['RaisonSociale'],
                (int)$_POST['Num_agence'],
            );
            
            
            header("Location: EditClient.php?id=" . $id);
exit;
    
        } else {
            die("Client et technicien obligatoires pour créer une intervention");
        }
    
    } 
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
    
    if (isset($_POST['Num_agence']) && $_POST['Num_agence'] !== '') {
        updateAgenceField($id, 'Num_agence', $_POST['Num_agence']);
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
        "NumClient" => "New",
        "Date_" => null,
    
        "RaisonSociale" => null,
        "SIREN" => null,
        "CodeApe" => null,
        "AdressePostale" => null,
        "NumTel" => null,
        "NumTelecopie" => null,
        "Email" => null,
        "DistanceAgenceKm" => null,
        "DuréeDeplacement" => null,
        "Nom" => null,
    
        "matricule" => null,
        "NomTech" => null,
        "PrenomTech" => null,
        "Qualification" => null,
        "EmailTech" => null,
        "NumTelTech" => null
    ];
    $interventionDuClient = [];
}

$Agences = getToutesLesAgences();

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
        
        <img class="logo" src="Image/logoClient.png" width="100">
        <!-- Menu de naviguation  -->
     <nav>
         <ul>
            <li> <a href="clients.php">Clients</a></li>
             <li> <a href="menu.php">Menu</a></li>
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
       <txt>Adresse : </txt>
<input class="input-odoo" type="text" name="AdressePostale"
       value="<?= htmlspecialchars($infoClient['AdressePostale']) ?>"></br>
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
    
    <select name="Num_agence" class="selectAgence">
        if {$id = 0}{
        <option value="" selected></option>
    }
        <?php foreach ($Agences as $Agence): ?>
            <option value="<?= $Agence['Num_Agence'] ?>"
                    <?= $infoClient['Nom'] == $Agence['Nom'] ? 'selected' : '' ?>>
                    <?= htmlspecialchars($Agence['Nom']) ?>
            </option>
        <?php endforeach; ?>

        </select></br>
       <txt>Distance de l'agence : </txt>
<input class="input-odoo" type="text" name="DistanceAgenceKm"
       value="<?= htmlspecialchars($infoClient['DistanceAgenceKm']) ?>"></br>
       <txt>Durée de deplacement : </txt>
<input class="input-odoo" type="text" name="DuréeDeplacement"
       value="<?= htmlspecialchars($infoClient['DuréeDeplacement']) ?>"></br>

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