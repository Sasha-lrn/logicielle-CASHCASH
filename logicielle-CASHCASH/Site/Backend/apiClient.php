<?php
 function gestionJson(){
	$json = file_get_contents('php://input');
	$data = json_decode($json);
	return  $data;
}
function api($requete){
    include_once __DIR__.'/getClientIntervention.php';
    include_once __DIR__.'/getListeTechniciens.php';
    include_once __DIR__.'/getStatsTechnicien.php'; 
    include_once __DIR__.'/getClientsLourd.php';

    //gérer les connexions 
    
    $serveur = "localhost";
    $utilisateur = "CashCash";
    $motdepasse = "3878ShOrtmUSI(";
    $basededonnees = "cashcash";// à paramétrer tout ça 

    $connexion = new mysqli($serveur, $utilisateur, $motdepasse, $basededonnees);
    if ($connexion->connect_error) {
        die("Connexion échouée : " . $connexion->connect_error);
    }
    $connexion->set_charset("utf8");
    
    $request_method = $_SERVER['REQUEST_METHOD'];

switch ($request_method){
    case 'GET':
       /* if($requete == 'clients'){
        echo getClientIntervention($connexion);
        $connexion->close();
        break;}
        else if($requete == 'stats')
        {
            $techniciens = getListeTechniciens($connexion);

            $mois = isset($_GET['mois']) ? intval($_GET['mois']) : date('m');
            $annee = isset($_GET['annee']) ? intval($_GET['annee']) : date('Y');
            $matricule = isset($_GET['technicien']) && $_GET['technicien'] !== ''
                ? intval($_GET['technicien'])
                : null;

            $stats = getStatsTechnicien($mois, $annee, $connexion, $matricule);

            $connexion->close();

            return [
                'techniciens' => $techniciens,
                'mois' => $mois,
                'annee' => $annee,
                'matricule' => $matricule,
                'stats' => $stats
            ];
           
            
            break;
        } */
        {
    $result = getClientsLourd($connexion); //
    echo json_encode($result, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    
        }
        break;
        }

        $connexion->close();
        }

        $requete = isset($_GET['requete']) ? $_GET['requete'] : '';
        api($requete);



   
    
?>
