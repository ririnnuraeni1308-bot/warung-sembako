<?php include 'includes/koneksi.php'; ?>
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Warung Sembako - Belanja Kebutuhan Pokok</title>
  <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

  <!-- TODO: navbar akan dipasang di sini (tugas anggota navigasi) -->

  <section class="hero">
    <div class="container">
      <h1>Belanja Sembako Mudah dan Murah</h1>
      <p>Beras, minyak, gula, dan kebutuhan dapur lainnya diantar ke rumahmu.</p>
      <a href="pages/produk.php" class="btn">Belanja Sekarang</a>
    </div>
  </section>

  <section class="section">
    <div class="container">
      <h2>Kenapa Belanja di Sini?</h2>
      <div class="grid">
        <div class="card"><div class="icon">💰</div><h3>Harga Terjangkau</h3><p>Harga bersaing untuk kebutuhan harian.</p></div>
        <div class="card"><div class="icon">🚚</div><h3>Antar ke Rumah</h3><p>Pesanan dikirim sampai depan pintu.</p></div>
        <div class="card"><div class="icon">✅</div><h3>Barang Berkualitas</h3><p>Stok segar dan selalu dicek.</p></div>
      </div>
    </div>
  </section>

  <section class="section">
    <div class="container">
      <h2>Produk Pilihan</h2>
      <div class="grid">
        <?php
        $query = mysqli_query($koneksi, "SELECT nama_produk, harga, satuan FROM produk ORDER BY id LIMIT 4");
        while ($p = mysqli_fetch_assoc($query)) {
        ?>
          <div class="card">
            <div class="icon">🛒</div>
            <h3><?php echo htmlspecialchars($p['nama_produk']); ?></h3>
            <p class="harga">Rp <?php echo number_format($p['harga'], 0, ',', '.'); ?> / <?php echo htmlspecialchars($p['satuan']); ?></p>
          </div>
        <?php } ?>
      </div>
    </div>
  </section>

  <footer class="footer-temp">
    <p>&copy; 2026 Warung Sembako</p>
  </footer>

</body>
</html>
