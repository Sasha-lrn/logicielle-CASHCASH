<?php
    $requete = 'stats';
    include_once __DIR__.'/../Backend/api.php';
    $data = api($requete);

$techniciens = $data['techniciens'];
$mois = $data['mois'];
$annee = $data['annee'];
$matricule = $data['matricule'];
$stats = $data['stats'];

?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Statistiques Techniciens</title>
    <link rel="stylesheet" type="text/css" href="statistiques.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
</head>
<body>

<header>
        
        <img class="logo" src="Image/logoStatistique.png" width="100">
        <!-- Menu de naviguation  -->
     <nav>
         <ul>
             <li> <a href="menu.php">Menu</a></li>
         </ul>
     </nav>
    </header>


<div class="stats-container">

    <div class="stats-box">
        <h1>Statistiques des techniciens</h1>

        <form method="get" class="stats-form">

            <label>Technicien :</label>
            <select name="technicien">
                <option value="">Tous</option>
                <?php foreach ($techniciens as $t): ?>
                    <option value="<?= $t['Matricule'] ?>"
                        <?= ($matricule == $t['Matricule']) ? 'selected' : '' ?>>
                        <?= htmlspecialchars($t['Nom'] . ' ' . $t['Prenom']) ?>
                    </option>
                <?php endforeach; ?>
            </select>

            <label>Mois :</label>
            <select name="mois">
                <?php for($m=1; $m<=12; $m++): ?>
                    <option value="<?= $m ?>" <?= ($mois == $m) ? 'selected' : '' ?>>
                        <?= $m ?>
                    </option>
                <?php endfor; ?>
            </select>

            <label>Année :</label>
            <input type="number" name="annee" value="<?= $annee ?>" min="2000" max="<?= date('Y') ?>">

            <button type="submit">Afficher</button>
        </form>

        <div class="table-wrapper">
            <table class="stats-table">
                <tr>
                    <th>Matricule</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Interventions</th>
                    <th>Kilomètres</th>
                    <th>Temps total</th>
                </tr>

                <?php if (!empty($stats)): ?>
                    <?php foreach ($stats as $s): ?>
                        <tr>
                            <td><?= htmlspecialchars($s['Matricule']) ?></td>
                            <td><?= htmlspecialchars($s['Nom']) ?></td>
                            <td><?= htmlspecialchars($s['Prenom']) ?></td>
                            <td><?= htmlspecialchars($s['NbInterventions']) ?></td>
                            <td><?= htmlspecialchars($s['KmParcourus']) ?> km</td>
                            <td><?= htmlspecialchars($s['TempsTotal']) ?></td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="6">Aucune intervention trouvée.</td>
                    </tr>
                <?php endif; ?>
            </table>
        </div>

    </div>

</div>

</html>