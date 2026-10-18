<?php
// Koneksi ke database MySQL (XAMPP)
$host = "localhost";
$user = "root";
$pass = "";
$db   = "toko_sembako";

$koneksi = mysqli_connect($host, $user, $pass, $db);

if (!$koneksi) {
    die("Koneksi database gagal: " . mysqli_connect_error());
}
