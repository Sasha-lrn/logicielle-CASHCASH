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
