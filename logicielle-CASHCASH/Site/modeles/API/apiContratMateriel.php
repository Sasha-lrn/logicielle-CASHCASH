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

        


        case 'PUT':
                // Récupère le corps JSON envoyé par le client
                $data = json_decode(file_get_contents('php://input'), true);
            
                if (!isset($data['NumContrat']) || !isset($data['DateEcheance'])) {
                    http_response_code(400);
                    header("Content-Type: application/json; charset=utf-8");
                    echo json_encode(["erreur" => "Paramètres manquants"]);
                    exit;
                }
            
                $numContrat = intval($data['NumContrat']);
                $dateEcheance = $data['DateEcheance'];
                $dateRenouvellement = isset($data['DateRenouvellement']) ? $data['DateRenouvellement'] : null;
            
                // Appelle une fonction pour faire l'update en base
                $result = updateRenouvellementContrat($numContrat, $dateEcheance, $dateRenouvellement);
            
                if ($result) {
                    http_response_code(200);
                    header("Content-Type: application/json; charset=utf-8");
                    echo json_encode(["message" => "Contrat mis à jour"]);
                } else {
                    http_response_code(500);
                    header("Content-Type: application/json; charset=utf-8");
                    echo json_encode(["erreur" => "Erreur lors de la mise à jour"]);
                }
                exit;

        case 'POST':

                    if (!isset($_GET['numContrat'])) {
                
                        http_response_code(400);
                
                        echo json_encode([
                            "erreur" => "numContrat manquant"
                        ]);
                
                        exit;
                    }
                
                    $numContrat = intval($_GET['numContrat']);
                
                    $data = json_decode(file_get_contents('php://input'), true);
                
                    if (!$data) {
                
                        http_response_code(400);
                
                        echo json_encode([
                            "erreur" => "JSON invalide"
                        ]);
                
                        exit;
                    }
                
                    $result = ajouterMaterielAuContrat($numContrat, $data);
                
                    if ($result) {
                
                        http_response_code(201);
                
                        echo json_encode([
                            "message" => "Matériel ajouté"
                        ]);
                    }
                    else {
                
                        http_response_code(500);
                
                        echo json_encode([
                            "erreur" => "Erreur insertion matériel"
                        ]);
                    }
                
                    exit;
                
            default:
            http_response_code(405);
            header("Content-Type: application/json; charset=utf-8");
            echo json_encode(["erreur" => "Méthode non autorisée"]);
            exit;
            
    }
}

apiContratMateriel();