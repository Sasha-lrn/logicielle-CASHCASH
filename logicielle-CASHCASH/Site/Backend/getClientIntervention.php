<?php
function getIntervention($connexion){
            ob_start(); 


                echo "<h2>Table : Interventions</h2>";
                
                $requete2 = "SELECT * FROM Intervention";
                $resultat2 = $connexion->query($requete2);
    
                if ($resultat2 && $resultat2->num_rows > 0) {
                    echo "<table>";
                    
                    // Récupérer les noms des colonnes
                    $champs = $resultat2->fetch_fields();
                    echo "<tr>";
                    foreach ($champs as $champ) {
                        echo "<th>" . htmlspecialchars($champ->name) . "</th>";
                    }
                    echo "</tr>";
                    
                    // Afficher les données
                    while ($ligne = $resultat2->fetch_assoc()) {
    
                        $id = $ligne['Id_Intervention'];
                    
                        echo '<tr class="ligne-clickable" data-id="' . htmlspecialchars($id) . '">';
                    
                        foreach ($ligne as $colonne => $valeur) {
                            echo "<td>" . htmlspecialchars($valeur) . "</td>";
                        }
                    
                        echo "</tr>";
                    }
                    
                    
                    echo "</table>";
                } else {
                    echo "<p>Aucune donnée trouvée dans la table produits.</p>";
                }
    
                // Fermer la connexion
                return ob_get_clean();
            }
            ?>