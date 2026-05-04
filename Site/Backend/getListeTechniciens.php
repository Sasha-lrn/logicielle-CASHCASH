<?php
// stats_techniciens.php

// Fonction pour récupérer la liste des techniciens
function getListeTechniciens($connexion) {
 
    $sql = "SELECT t.Matricule, t.Nom, t.Prenom 
            FROM Technicien te
            JOIN Employé t ON t.Matricule = te.Matricule
            ORDER BY t.Nom, t.Prenom";

    $result = $connexion->query($sql);
    $techniciens = [];
    while ($row = $result->fetch_assoc()) {
        $techniciens[] = $row;
    }

    return $techniciens;
}




