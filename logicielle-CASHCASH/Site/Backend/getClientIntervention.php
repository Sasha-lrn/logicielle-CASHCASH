<?php
    function getClientIntervention($connexion){
        ob_start(); 
        // buffer de sortie



  
           /* // Configuration de la connexion à la base de données
            $serveur = "localhost";
            $utilisateur = "login5344";
            $motdepasse = "tsoBPAwRCrAkJaX";
            $basededonnees = "cashcash";

            // Créer la connexion
            $connexion = new mysqli($serveur, $utilisateur, $motdepasse, $basededonnees);

            // Définir l'encodage
            $connexion->set_charset("utf8");*/

            // ========== PREMIÈRE TABLE ========== */
            echo "<h2>Table : Clients</h2>";
            
            $resultat1 = $connexion->query("SELECT * FROM Client");

            if ($resultat1 && $resultat1->num_rows > 0) {
                echo "<table>";
                
                // Récupérer les noms des colonnes
                $champs = $resultat1->fetch_fields();
                echo "<tr>";
                foreach ($champs as $champ) {
                    echo "<th>" . htmlspecialchars($champ->name) . "</th>";
                }
                echo "</tr>";
                
                // Afficher les données
                while ($ligne = $resultat1->fetch_assoc()) {
                    $id = $ligne['NumClient'];
                    echo '<tr class="ligne-clickable-Client" data-id="' . htmlspecialchars($id) . '">';
                    foreach ($ligne as $valeur) {
                        echo "<td>" . htmlspecialchars($valeur) . "</td>";
                    }
                    echo "</tr>";
                }
                
                echo "</table>";
            } else {
                echo "<p>Aucune donnée trouvée dans la table utilisateurs.</p>";
            }

            // ========== DEUXIÈME TABLE ==========
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