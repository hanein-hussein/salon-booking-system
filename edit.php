<?php
require_once 'helpers.php';

header("Content-Type: application/json");

$id      = (int) ($_POST['id'] ?? 0);
$booking = $id ? getBookingById($pdo, $id) : null;

if (!$booking) {
  echo json_encode(["status" => "error", "message" => "الحجز مش موجود"]);
  exit;
}

if (!canEdit($booking['created_at'])) {
  echo json_encode(["status" => "error", "message" => "انتهت مدة التعديل، تواصلي معنا"]);
  exit;
}

try {
  updateBooking(
    $pdo,
    $id,
    (int) $_POST['service_id'],
    trim($_POST['booking_date']),
    trim($_POST['notes'] ?? '')
  );
  echo json_encode(["status" => "success", "message" => "تم تعديل الحجز بنجاح"]);
} catch (PDOException $e) {
  echo json_encode(["status" => "error", "message" => "حدث خطأ أثناء التعديل"]);
}