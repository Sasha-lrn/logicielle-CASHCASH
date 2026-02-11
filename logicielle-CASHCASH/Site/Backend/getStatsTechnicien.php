<?php
function getStatsTechnicien($mois, $annee, $connexion, $matricule = null) {

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
        WHERE MONTH(i.Date_) = ? AND YEAR(i.Date_) = ?
    ";

    if ($matricule !== null) {
        $sql .= " AND t.Matricule = ?";
    }

    $sql .= " GROUP BY t.Matricule, t.Nom, t.Prenom
              ORDER BY t.Nom, t.Prenom";

    $stmt = $connexion->prepare($sql);

    if (!$stmt) {
        die("Erreur SQL : " . $connexion->error);
    }

    if ($matricule !== null) {
        $stmt->bind_param("iii", $mois, $annee, $matricule);
    } else {
        $stmt->bind_param("ii", $mois, $annee);
    }

    $stmt->execute();
    $result = $stmt->get_result();

    $stats = [];
    while ($row = $result->fetch_assoc()) {
        $stats[] = $row;
    }

    $stmt->close();

    return $stats;
}
?>