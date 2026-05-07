<?php
// recherche.php
include_once __DIR__ . '/modeles/mesFonctionsAccesDonnes.php';

// On récupère les données via votre fonction
$clients = getTousLesClients();

// On précise au navigateur qu'on envoie du JSON
header('Content-Type: application/json');
echo json_encode($clients);

?>