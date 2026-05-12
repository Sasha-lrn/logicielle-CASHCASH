<?php
include_once __DIR__ . '/modeles/mesFonctionsAccesDonnes.php';
$interventions = getTousLesInterventions();
header('Content-Type: application/json');
echo json_encode($interventions);

?>