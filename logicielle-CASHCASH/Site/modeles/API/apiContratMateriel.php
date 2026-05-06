<?php

include_once __DIR__.'/../../modeles/mesFonctionsAccesDonnes.php';

function apiContratMateriel(){

    $request_method = $_SERVER['REQUEST_METHOD'];

    switch ($request_method) {

        case 'GET':

            if (!isset($_GET['id'])) {
                http_response_code(400);
                header("Content-Type: application/json; charset=utf-8"); //sert à envoyer des informations HTTP au navigateur ou au client (C#).
                echo json_encode(["erreur" => "Paramètre id manquant"]);
                exit;
            }

            $id = intval($_GET['id']);//convertir $_GET['id'] = "12"   // string en int 12

            $contrat = getContratMaterielJSON($id);

            if (!$contrat) {
                http_response_code(404);
                header("Content-Type: application/json; charset=utf-8");
                echo json_encode(["erreur" => "Aucun contrat trouvé"]);
                exit;
            }

            http_response_code(200);
            header("Content-Type: application/json; charset=utf-8");
            echo json_encode($contrat);
            exit;

        default:
            http_response_code(405);
            header("Content-Type: application/json; charset=utf-8");
            echo json_encode(["erreur" => "Méthode non autorisée"]);
            exit;
    }
}

apiContratMateriel();