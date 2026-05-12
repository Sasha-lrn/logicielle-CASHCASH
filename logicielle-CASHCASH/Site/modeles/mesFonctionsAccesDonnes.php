<?php
include_once __DIR__ . '/../global/config.php';
include_once __DIR__ . '/../libs/pdo2.php';

function getInterventionComplete(int $idIntervention)
{
    $pdo = PDO2::getInstance();

    $sql = "
        SELECT 
            i.Id_Intervention,
            i.Date_,

            c.RaisonSociale,
            c.AdressePostale,
            c.NumTel,
            c.Email,
            c.NumClient,
            c.DistanceAgenceKm,

            t.matricule,
            e.Nom AS NomTech,
            e.Prenom AS PrenomTech,
            t.Qualification,
            t.Email AS EmailTech,
            a.Nom AS NomAgence,
            t.NumTel AS NumTelTech
            

        FROM Intervention i
        JOIN Client c ON i.NumClient = c.NumClient
        JOIN Technicien t ON i.Matricule = t.Matricule
        JOIN Employé e ON t.Matricule = e.Matricule
        JOIN Agence a ON e.Num_Agence = a.Num_Agence

        WHERE i.Id_Intervention = :id
    ";

    $req = $pdo->prepare($sql);
    $req->bindValue(':id', $idIntervention, PDO::PARAM_INT);
    $req->execute();

    return $req->fetch(PDO::FETCH_ASSOC);
}



function getInfoCLient(int $id){
    $pdo = PDO2::getInstance();

    $sql = "
    SELECT 
    c.RaisonSociale,
    c.SIREN,
    c.CodeApe,
    c.AdressePostale,
    c.NumTel,
    c.NumTelecopie,
    c.Email,
    c.NumClient,
    c.DistanceAgenceKm,
    c.DuréeDeplacement,
    a.Nom
    FROM Client c
    JOIN Agence a ON c.Num_Agence = a.Num_Agence
    WHERE NumCLient = :id
    ";

    $req = $pdo->prepare($sql);
    $req->bindValue(':id', $id, PDO::PARAM_INT);
    $req->execute();

    return $req->fetch(PDO::FETCH_ASSOC);
}
function getInterventionDuClient(int $id){
    $pdo = PDO2::getInstance();

    $sql = "
    SELECT Intervention.Id_Intervention,Intervention.Date_, Employé.Nom, Employé.Prenom FROM `Employé`
INNER JOIN Technicien on Employé.Matricule = Technicien.Matricule
INNER JOIN Intervention on Technicien.Matricule= Intervention.Matricule
WHERE NumClient = :id;
    ";

    $req = $pdo->prepare($sql);
    $req->bindValue(':id', $id, PDO::PARAM_INT);
    $req->execute();

    return $req->fetchAll (PDO::FETCH_ASSOC);
}

function getMaterielsByIntervention(int $idIntervention)
{
    $pdo = PDO2::getInstance();

    $sql = "
        SELECT 
            m.NumSerie,
            t.Libellé,
            m.Emplacement,
            ipm.TempsIntervention
        FROM InterventionParMateriel ipm
        JOIN Matériel m ON ipm.NumSerie = m.NumSerie
        JOIN Type t ON m.ReferenceInterne = t.ReferenceInterne
        WHERE ipm.Id_Intervention = :id
    ";

    $req = $pdo->prepare($sql);
    $req->bindValue(':id', $idIntervention, PDO::PARAM_INT);
    $req->execute();

    return $req->fetchAll(PDO::FETCH_ASSOC);
}

function getTousLesMateriels()
{
    $pdo = PDO2::getInstance();

    $sql = "
        SELECT 
            m.NumSerie,
            t.Libellé,
            m.Emplacement
        FROM Matériel m
        JOIN Type t ON m.ReferenceInterne = t.ReferenceInterne
        ORDER BY m.NumSerie
    ";

    return $pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC);
}

function getTousLesClients()
{
    $pdo = PDO2::getInstance();

    $sql = "
        SELECT 
        c.RaisonSociale,
        c.AdressePostale,
        c.NumTel,
        c.Email,
        c.NumClient,
        c.DistanceAgenceKm 
        FROM Client c

    ";

    return $pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC);
}
function getClientsRecherche($type, $valeur)
{
    $pdo = PDO2::getInstance();

    // Liste blanche des colonnes autorisées
    $colonnesAutorisees = [
        'RaisonSociale', 
        'AdressePostale', 
        'NumTel', 
        'Email', 
        'NumClient', 
        'DistanceAgenceKm'
    ];
    
    if (!in_array($type, $colonnesAutorisees)) {
        return [];
    }
    
    // 2. On prépare la requête SQL (les % ne sont plus ici)
    $sql = "
        SELECT 
            c.RaisonSociale,
            c.AdressePostale,
            c.NumTel,
            c.Email,
            c.NumClient,
            c.DistanceAgenceKm 
        FROM Client c
        WHERE LOWER(c.$type) LIKE LOWER(:valeur)
    ";
    
    $req = $pdo->prepare($sql);
    
    // 3. On ajoute les % à la valeur AVANT de l'envoyer à la requête
    // On utilise bindValue ou on le passe dans l'execute
    $recherche = "%" . $valeur . "%";
    $req->bindValue(':valeur', $recherche, PDO::PARAM_STR);
    
    $req->execute();
    
    return $req->fetchAll(PDO::FETCH_ASSOC);
}


function getInterventionsRecherche($type, $valeur)
{
    $pdo = PDO2::getInstance();

    // Liste blanche des colonnes autorisées
    $colonnesAutorisees = [
        'id_Intervention', 
        'Date_', 
        'NumClient', 
        'Matricule'
    ];
    
    if (!in_array($type, $colonnesAutorisees)) {
        return [];
    }
    
    // 2. On prépare la requête SQL (les % ne sont plus ici)
    $sql = "
        SELECT 
            i.Id_Intervention,
            i.Date_,
            i.NumClient,
            i.Matricule 
        FROM Intervention i
        WHERE LOWER(i.$type) LIKE LOWER(:valeur)
    ";
    
    $req = $pdo->prepare($sql);
    
    // 3. On ajoute les % à la valeur AVANT de l'envoyer à la requête
    // On utilise bindValue ou on le passe dans l'execute
    $recherche = "%" . $valeur . "%";
    $req->bindValue(':valeur', $recherche, PDO::PARAM_STR);
    
    $req->execute();
    
    return $req->fetchAll(PDO::FETCH_ASSOC);
}
function getClientsLourd() {

    $pdo = PDO2::getInstance();

    $sql = "SELECT NumClient, RaisonSociale, SIREN, CodeAPE, AdressePostale, 
                   NumTel, NumTelecopie, Email, DistanceAgenceKm, 
                   DuréeDeplacement, Num_Agence
            FROM Client";

    return $pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC); }

    function getContratMaterielJSON($numClient){

        $pdo = PDO2::getInstance();

        $sql = "SELECT 
    c.NumClient,
    cm.NumContrat,
    cm.DateSignature,
    cm.DateEcheance,
    m.NumSerie,
    m.DateInstallation,
    m.Prix,
    m.Emplacement,
    t.ReferenceInterne,
    t.Libellé
    FROM Client c
    LEFT JOIN Contrat_Maintenance cm ON c.NumClient = cm.NumClient
    LEFT JOIN Maintenir mt ON cm.NumContrat = mt.NumContrat
    LEFT JOIN Matériel m ON mt.NumSerie = m.NumSerie
    LEFT JOIN Type t ON m.ReferenceInterne = t.ReferenceInterne
    WHERE c.NumClient = :id";

    $stmt = $pdo->prepare($sql);
    $stmt->execute(['id' => $numClient]);

    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (!$rows) return null;

    // Construction du JSON structuré
    $contrat = [
        "NumContrat" => $rows[0]["NumContrat"],
        "DateSignature" => $rows[0]["DateSignature"],
        "DateEcheance" => $rows[0]["DateEcheance"],
        "LesMateriels" => []
    ];

    foreach ($rows as $row) {

        if ($row["NumSerie"]) {

            $materiel = [
                "NumSerie" => $row["NumSerie"],
                "DateInstallation" => $row["DateInstallation"],
                "Prix" => floatval($row["Prix"]),
                "Emplacement" => $row["Emplacement"],
                "LeType" => [
                    "ReferenceInterne" => $row["ReferenceInterne"],
                    "Libellé" => $row["Libellé"]
                ]
            ];

            $contrat["LesMateriels"][] = $materiel;
        }
    }

    return $contrat;
}
    


function getTousLesInterventions()
{
    $pdo = PDO2::getInstance();

    $sql = "
    SELECT id_Intervention, 
    Date_, 
    NumClient,
    Matricule 
    FROM `Intervention`;
    ";

    return $pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC);
}


function getTousLesTechniciens()
{
    $pdo = PDO2::getInstance();

    $sql = "
    SELECT t.matricule,
    e.Nom AS NomTech,
    e.Prenom AS PrenomTech,
    t.Qualification,
    t.Email AS EmailTech,
    a.Nom AS NomAgence,
    t.NumTel AS NumTelTech
    FROM Technicien t
    JOIN Employé e ON t.Matricule = e.Matricule
    JOIN Agence a ON e.Num_Agence = a.Num_Agence;

    ";

    return $pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC);
}

function getListeTechniciens()
{
    $pdo = PDO2::getInstance();

    $sql = "
        SELECT t.Matricule, t.Nom, t.Prenom 
        FROM Technicien te
        JOIN Employé t ON t.Matricule = te.Matricule
        ORDER BY t.Nom, t.Prenom
    ";

    $stmt = $pdo->query($sql);

    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function getStatsTechnicien($mois, $annee, $matricule = null)
{
    $pdo = PDO2::getInstance();

    $sql = "
        SELECT 
            t.Matricule,
            t.Nom,
            t.Prenom,
            COUNT(DISTINCT i.Id_Intervention) AS NbInterventions,
            SUM(c.DistanceAgenceKm) * 2 AS KmParcourus,
            SEC_TO_TIME(SUM(TIME_TO_SEC(ipm.TempsIntervention))) AS TempsTotal
        FROM Technicien te
        JOIN Employé t ON t.Matricule = te.Matricule
        JOIN Intervention i ON i.Matricule = te.Matricule
        JOIN Client c ON c.NumClient = i.NumClient
        JOIN InterventionParMateriel ipm ON ipm.Id_Intervention = i.Id_Intervention
        WHERE MONTH(i.Date_) = :mois
          AND YEAR(i.Date_) = :annee
    ";

    if ($matricule !== null) {
        $sql .= " AND t.Matricule = :matricule";
    }

    $sql .= "
        GROUP BY t.Matricule, t.Nom, t.Prenom
        ORDER BY t.Nom, t.Prenom
    ";

    $stmt = $pdo->prepare($sql);

    $params = [
        ':mois' => $mois,
        ':annee' => $annee
    ];

    if ($matricule !== null) {
        $params[':matricule'] = $matricule;
    }

    $stmt->execute($params);

    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function getToutesLesAgences(){
    $pdo = PDO2::getInstance();
    $sql = "
    SELECT * FROM Agence";

    return $pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC);
}

function updateIntervention(int $id, string $date,$client)
{
    $pdo = PDO2::getInstance();

    $sql = "UPDATE Intervention SET Date_ = :date WHERE Id_Intervention = :id";
    $req = $pdo->prepare($sql);
    $req->bindValue(':date', $date);
    $req->bindValue(':id', $id, PDO::PARAM_INT);
    //$req->bindValue(':NumClient', $client, PDO::PARAM_INT);
    $req->execute();
    return $client;
}
function updateClientIntervention(int $id, int $client)
{
    $pdo = PDO2::getInstance();

    $sql = "UPDATE Intervention 
            SET NumClient = :client 
            WHERE Id_Intervention = :id";

    $req = $pdo->prepare($sql);

    $req->bindValue(':client', $client, PDO::PARAM_INT);
    $req->bindValue(':id', $id, PDO::PARAM_INT);

    $req->execute();
}
function updateTechnicienIntervention(int $id, int $matricule)
{
    $pdo = PDO2::getInstance();

    $sql = "UPDATE Intervention 
            SET Matricule = :matricule 
            WHERE Id_Intervention = :id";

    $req = $pdo->prepare($sql);

    $req->bindValue(':matricule', $matricule, PDO::PARAM_INT);
    $req->bindValue(':id', $id, PDO::PARAM_INT);

    $req->execute();
}

function updateTempsMateriel(int $id, int $numSerie, string $temps)
{
    $pdo = PDO2::getInstance();

    $sql = "
        UPDATE InterventionParMateriel
        SET TempsIntervention = :temps
        WHERE Id_Intervention = :id
        AND NumSerie = :numSerie
    ";

    $req = $pdo->prepare($sql);
    $req->bindValue(':temps', $temps);
    $req->bindValue(':id', $id, PDO::PARAM_INT);
    $req->bindValue(':numSerie', $numSerie, PDO::PARAM_INT);
    $req->execute();
}





function ajouterMaterielIntervention(int $idIntervention, int $numSerie, string $temps)
{
    $pdo = PDO2::getInstance();

    $sql = "
        INSERT INTO InterventionParMateriel (Id_Intervention, NumSerie, TempsIntervention)
        VALUES (:id, :numSerie, :temps)
    ";

    $req = $pdo->prepare($sql);
    $req->execute([
        ':id' => $idIntervention,
        ':numSerie' => $numSerie,
        ':temps' => $temps
    ]);
}



function createIntervention($date, $client, $technicien)
{
    $pdo = PDO2::getInstance();

    $sql = "INSERT INTO Intervention (Date_, NumClient, Matricule)
            VALUES (:date, :client, :technicien)";

    $req = $pdo->prepare($sql);
    $req->bindValue(':date', $date);
    $req->bindValue(':client', $client, PDO::PARAM_INT);
    $req->bindValue(':technicien', $technicien, PDO::PARAM_INT);
    $req->execute();

    return $pdo->lastInsertId(); // 🔥 super important
}
function createClient($RaisonSociale, $Num_Agence)
{
    $pdo = PDO2::getInstance();

    $sql = "INSERT INTO Client (RaisonSociale, Num_Agence)
            VALUES (:RaisonSociale, :Num_Agence)";

    $req = $pdo->prepare($sql);
    $req->bindValue(':RaisonSociale', $RaisonSociale);
    $req->bindValue(':Num_Agence', $Num_Agence, PDO::PARAM_INT);
    $req->execute();

    return $pdo->lastInsertId();
}



function supprimerMaterielIntervention(int $idIntervention, int $numSerie)
{
    $pdo = PDO2::getInstance();

    $sql = "
        DELETE FROM InterventionParMateriel
        WHERE Id_Intervention = :id
        AND NumSerie = :numSerie
    ";
    
    $req = $pdo->prepare($sql);
    $req->bindValue(':id', $idIntervention, PDO::PARAM_INT);
    $req->bindValue(':numSerie', $numSerie, PDO::PARAM_INT);
    $req->execute();
}



function updateEmplacementMateriel(int $numSerie, string $emplacement)
{
    $pdo = PDO2::getInstance();

    $sql = "UPDATE Matériel SET Emplacement = :emp WHERE NumSerie = :num";
    $req = $pdo->prepare($sql);
    $req->execute([
        ':emp' => $emplacement,
        ':num' => $numSerie
    ]);
}





function updateClientField($id, $field, $value) {
    $allowedFields = [
        'RaisonSociale',
        'SIREN',
        'CodeApe',
        'NumTelecopie',
        'NumTel',
        'Email',
        'DistanceAgenceKm',
        'DuréeDeplacement',
        'AdressePostale'
    ];

    if (!in_array($field, $allowedFields)) {
        return;
    }

    $pdo = PDO2::getInstance();

    $sql = "UPDATE Client SET $field = :value WHERE NumClient = :id";
    $stmt = $pdo->prepare($sql);

    $stmt->execute([
        ':value' => $value,
        ':id' => $id
    ]);
}
function updateAgenceField($id, $field, $value) {
    $allowedFields = ['Num_agence'];

    if (!in_array($field, $allowedFields)) {
        return;
    }

    $pdo = PDO2::getInstance();

    $sql = "
        UPDATE Client c
        SET c.$field = :value
        WHERE c.NumClient = :id
    ";

    $stmt = $pdo->prepare($sql);

    $stmt->execute([
        ':value' => $value,
        ':id' => $id
    ]);
}
?>
