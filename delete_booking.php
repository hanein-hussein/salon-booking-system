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
  echo json_encode(["status" => "error", "message" => "انتهت مدة الحذف، تواصلي معنا"]);
  exit;
}

try {
  deleteBooking($pdo, $id);
  echo json_encode(["status" => "success"]);
} catch (PDOException $e) {
  echo json_encode(["status" => "error", "message" => "حدث خطأ أثناء الحذف"]);
}