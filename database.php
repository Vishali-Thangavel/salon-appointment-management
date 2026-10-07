<?php
ob_start();
session_start();
$pdo = new PDO('mysql:host=localhost;dbname=salon_management;charset=utf8mb4', 'root', '', [
  PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC]);
function e($s){ return htmlspecialchars((string)$s, ENT_QUOTES, 'UTF-8'); }
function need_user(){ if(empty($_SESSION['uid'])){ header('Location: login.php'); exit; } }
function need_admin(){ if(empty($_SESSION['aid'])){ header('Location: login.php'); exit; } }
