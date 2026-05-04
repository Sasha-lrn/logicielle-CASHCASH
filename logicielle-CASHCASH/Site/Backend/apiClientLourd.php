<?php
//-----------------------------------------
$serveur = "localhost";
$utilisateur = "login5344";
$motdepasse = "tsoBPAwRCrAkJaX";
$basededonnees = "cashcash";
$connexion = new mysqli($serveur, $utilisateur, $motdepasse, $basededonnees);//utiliser PDO
if ($connexion->connect_error){
    die("Connexion échouée : " . $connexion->connect_error);
}
$connexion->set_charset("utf8");
//--------------------------------------

function getClientsLourd($connexion) {
    $sql = "SELECT NumClient, RaisonSociale, SIREN, CodeAPE, AdressePostale, 
                   NumTel, NumTelecopie, Email, DistanceAgenceKm, 
                   DuréeDeplacement, Num_Agence
            FROM Client";

    $result = $connexion->query($sql);

    if (!$result) {
        http_response_code(500);
        echo json_encode(["erreur" => $connexion->error]);
        return;
    }

    $clients = [];
    while ($row = $result->fetch_assoc()) {
        $clients[] = $row;
    }

    header("Content-Type: application/json; charset=utf-8");
    json_encode($clients, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    return $clients;
}

