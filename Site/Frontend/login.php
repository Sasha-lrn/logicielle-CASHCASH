<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    // ⚠️ test (à remplacer par BDD après)
    $valid_email = "admin@prestinfo.fr";
    $valid_password = "1234";

    if ($email === $valid_email && $password === $valid_password) {

        // connexion OK
        $_SESSION['user'] = $email;

        header("Location: menu.php");
        exit();

    } else {
        // erreur connexion
        echo "Email ou mot de passe incorrect";
    }
}
?>