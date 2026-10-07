<?php function service_card($s){ ?>
<article class="card"><img src="images/<?= e($s['image']) ?>" alt="<?= e($s['name']) ?>">
<div class="cb"><h3><?= e($s['name']) ?></h3><p><?= e($s['description']) ?></p>
<div class="meta"><b>₹<?= number_format($s['price']) ?></b><span>⏱ <?= (int)$s['duration'] ?> min</span></div>
<a class="btn sm" href="book_appointment.php?service=<?= (int)$s['id'] ?>">Book Now</a></div></article>
<?php } ?>
