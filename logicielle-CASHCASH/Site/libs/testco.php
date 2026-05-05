<?php

require __DIR__.'/pdo2.php';

try {
    $db = PDO2::getInstance();
} catch (Exception $e) {
    echo "Erreur : " . $e->getMessage();
}