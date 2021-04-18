-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Apr 2021 pada 16.39
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `attendee`
--

CREATE TABLE `attendee` (
  `attendee_id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `dateofbirth` date NOT NULL,
  `emailaddress` varchar(100) NOT NULL,
  `contactnumber` varchar(15) NOT NULL,
  `specialty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `attendee`
--

INSERT INTO `attendee` (`attendee_id`, `firstname`, `lastname`, `dateofbirth`, `emailaddress`, `contactnumber`, `specialty_id`) VALUES
(1, 'Vidya', 'ramadani', '0000-00-00', 'vidyavio2412@gmail.com', '0821-4219-2299', 1),
(3, 'Reana', 'Vidya', '0000-00-00', 'vidyavio2412@gmail.com', '0821-4219-2299', 2),
(15, 'Vidya', 'ramadani', '2021-04-08', 'vidyavio2412@gmail.com', '0821-4219-2299', 2),
(27, 'Vidya', 'ramadani', '2021-04-13', 'vidyavio2412@gmail.com', '0821-4219-2299', 1),
(28, 'AD REANA', 'VIDYA RAMADANI', '2000-10-30', 'vidya@gmail.com', '000111222', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `specialties`
--

CREATE TABLE `specialties` (
  `specialty_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `specialties`
--

INSERT INTO `specialties` (`specialty_id`, `name`) VALUES
(1, 'Database Admin'),
(2, 'Software Developer'),
(3, 'Web Administrator');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(3, 'admin', '80a19f669b02edfbc208a5386ab5036b'),
(11, 'admin', '80a19f669b02edfbc208a5386ab5036b');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `attendee`
--
ALTER TABLE `attendee`
  ADD PRIMARY KEY (`attendee_id`),
  ADD KEY `fk_attendee_specialties` (`specialty_id`);

--
-- Indeks untuk tabel `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`specialty_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `attendee`
--
ALTER TABLE `attendee`
  MODIFY `attendee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `specialties`
--
ALTER TABLE `specialties`
  MODIFY `specialty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `attendee`
--
ALTER TABLE `attendee`
  ADD CONSTRAINT `fk_attendee_specialties` FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`specialty_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
