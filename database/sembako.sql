-- Database Toko Sembako
-- Import lewat phpMyAdmin (XAMPP): http://localhost/phpmyadmin

CREATE DATABASE IF NOT EXISTS toko_sembako
  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE toko_sembako;

-- Tabel pengguna (admin & pelanggan)
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  no_hp VARCHAR(20),
  alamat TEXT,
  role ENUM('admin','pelanggan') DEFAULT 'pelanggan',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel kategori produk
CREATE TABLE kategori (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama_kategori VARCHAR(50) NOT NULL
);

-- Tabel produk
CREATE TABLE produk (
  id INT AUTO_INCREMENT PRIMARY KEY,
  kategori_id INT NOT NULL,
  nama_produk VARCHAR(100) NOT NULL,
  deskripsi TEXT,
  harga INT NOT NULL,
  stok INT NOT NULL DEFAULT 0,
  satuan VARCHAR(20) DEFAULT 'pcs',
  gambar VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (kategori_id) REFERENCES kategori(id)
);

-- Tabel keranjang
CREATE TABLE keranjang (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  produk_id INT NOT NULL,
  jumlah INT NOT NULL DEFAULT 1,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (produk_id) REFERENCES produk(id) ON DELETE CASCADE
);

-- Tabel pesanan
CREATE TABLE pesanan (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  total_harga INT NOT NULL,
  alamat_kirim TEXT NOT NULL,
  status ENUM('pending','diproses','dikirim','selesai','batal') DEFAULT 'pending',
  tanggal TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Tabel detail pesanan
CREATE TABLE detail_pesanan (
  id INT AUTO_INCREMENT PRIMARY KEY,
  pesanan_id INT NOT NULL,
  produk_id INT NOT NULL,
  jumlah INT NOT NULL,
  harga_satuan INT NOT NULL,
  FOREIGN KEY (pesanan_id) REFERENCES pesanan(id) ON DELETE CASCADE,
  FOREIGN KEY (produk_id) REFERENCES produk(id)
);

-- Data awal
INSERT INTO kategori (nama_kategori) VALUES
('Beras & Tepung'), ('Minyak & Gula'), ('Bumbu Dapur'),
('Mie & Makanan Instan'), ('Telur & Susu');

INSERT INTO produk (kategori_id, nama_produk, deskripsi, harga, stok, satuan) VALUES
(1, 'Beras Premium 5kg', 'Beras pulen kualitas premium', 70000, 50, 'karung'),
(1, 'Tepung Terigu 1kg', 'Tepung terigu serbaguna', 13000, 80, 'kg'),
(2, 'Minyak Goreng 2L', 'Minyak goreng kemasan', 38000, 60, 'botol'),
(2, 'Gula Pasir 1kg', 'Gula pasir putih', 17000, 100, 'kg'),
(3, 'Garam Dapur 250g', 'Garam beryodium', 3000, 120, 'bungkus'),
(4, 'Mie Instan Goreng', 'Mie instan rasa goreng', 3500, 200, 'bungkus'),
(5, 'Telur Ayam 1kg', 'Telur ayam segar', 29000, 40, 'kg'),
(5, 'Susu UHT 1L', 'Susu UHT full cream', 18000, 45, 'kotak');

-- Akun admin awal (ganti password nanti lewat aplikasi)
INSERT INTO users (nama, email, password, role) VALUES
('Admin', 'admin@sembako.test', 'GANTI_DENGAN_PASSWORD_HASH', 'admin');
