<?php
require_once 'db.php';

function canEdit($created_at) {
  return (time() - strtotime($created_at)) < 86400;
}

function getBookingById($pdo, $id) {
  $stmt = $pdo->prepare("
    SELECT
      bookings.booking_id,
      bookings.booking_date,
      bookings.notes,
      bookings.created_at,
      services.id,
      services.service_name,
      clients.client_name
    FROM bookings
    INNER JOIN services ON bookings.service_id = services.id
    INNER JOIN clients  ON bookings.client_id  = clients.id
    WHERE bookings.booking_id = ?
  ");
  $stmt->execute([$id]);
  return $stmt->fetch(PDO::FETCH_ASSOC);
}

function getBookingsByPhone($pdo, $phone) {
  $stmt = $pdo->prepare("
    SELECT
      bookings.booking_id,
      clients.client_name,
      services.service_name,
      services.id AS service_id,
      bookings.booking_date,
      bookings.notes,
      bookings.created_at
    FROM bookings
    INNER JOIN clients  ON bookings.client_id  = clients.id
    INNER JOIN services ON bookings.service_id = services.id
    WHERE clients.phone = ?
    ORDER BY bookings.booking_id DESC
  ");
  $stmt->execute([$phone]);
  return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function getServices($pdo) {
  return $pdo->query("SELECT id, service_name FROM services")
             ->fetchAll(PDO::FETCH_ASSOC);
}

function updateBooking($pdo, $id, $service_id, $booking_date, $notes) {
  $stmt = $pdo->prepare("
    UPDATE bookings SET service_id = ?, booking_date = ?, notes = ?
    WHERE booking_id = ?
  ");
  $stmt->execute([$service_id, $booking_date, $notes, $id]);
}

function deleteBooking($pdo, $id) {
  $pdo->prepare("DELETE FROM bookings WHERE booking_id = ?")
      ->execute([$id]);
}