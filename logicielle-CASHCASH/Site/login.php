<?php
session_start();
include_once __DIR__ . '/libs/pdo2.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $login = $_POST['login'] ?? '';
    $password = $_POST['password'] ?? '';

    try {
        // Connexion BDD
        $pdo = PDO2::getInstance();
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // 🔐 requête préparée (anti SQL injection)
        $stmt = $pdo->prepare("SELECT Matricule, login, motDePasse FROM Employé WHERE login = :login");
        $stmt->execute(['login' => $login]);

        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        // 🔑 SHA1 comparison
        if ($user && $user['motDePasse'] === sha1($password)) {

            session_regenerate_id(true); // sécurité session

            $_SESSION['user_id'] = $user['Matricule'];
            $_SESSION['login'] = $user['login'];

            header("Location: menu.php");
            exit();

        } else {
            echo "Email ou mot de passe incorrect";
        }

    } catch (PDOException $e) {
        echo "Erreur serveur";
        
    }
}
?>