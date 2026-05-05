<?php

include_once __DIR__.'/../../modeles/mesFonctionsAccesDonnes.php';

function gestionJson(){
    $json = file_get_contents('php://input');
    return json_decode($json, true);
}

function apiClients(){

    $request_method = $_SERVER['REQUEST_METHOD'];

    switch ($request_method) {

        case 'GET':

            $clients = getClientsLourd();

            if (!$clients) {
                http_response_code(404);
                header("Content-Type: application/json; charset=utf-8");
                echo json_encode(["erreur" => "Aucun client"]);
                exit;
            }

            http_response_code(200);
            header("Content-Type: application/json; charset=utf-8");
            echo json_encode($clients);
            exit;

        default:
            http_response_code(405);
            header("Content-Type: application/json; charset=utf-8");
            echo json_encode(["erreur" => "Méthode non autorisée"]);
            exit;
    }
    
}apiClients();