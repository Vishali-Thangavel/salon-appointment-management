<?php require_once __DIR__.'/../config/database.php'; $page=basename($_SERVER['PHP_SELF']); ?>
<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title><?= e($title ?? 'Glow Salon') ?> | Glow Salon</title>
<link rel="stylesheet" href="css/style.css"></head><body>
<header class="nav"><a class="logo" href="index.php">💇 Glow<span>Salon</span></a>
<button id="menuBtn" aria-label="Menu">☰</button>
<nav id="menu"><?php foreach(['index.php'=>'Home','about.php'=>'About','services.php'=>'Services','stylists.php'=>'Stylists','contact.php'=>'Contact'] as $f=>$l): ?>
<a class="<?= $page==$f?'on':'' ?>" href="<?= $f ?>"><?= $l ?></a><?php endforeach; ?>
<?php if(!empty($_SESSION['uid'])): ?><a href="my_appointments.php">My Appointments</a><a href="logout.php">Logout</a>
<?php else: ?><a href="login.php">Login</a><a href="register.php">Register</a><?php endif; ?>
<a class="btn sm" href="book_appointment.php">Book Now</a></nav></header>
