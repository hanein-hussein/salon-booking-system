<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
require_once 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $name    = trim($_POST['name']);
    $phone   = trim($_POST['phone']);
    $service = trim($_POST['service']);
    $date    = trim($_POST['date']);
    $notes   = trim($_POST['notes']);

    try {
        // أول حاجة - نشوف العميلة موجودة ولا لا
        $stmt = $pdo->prepare("SELECT id FROM clients WHERE phone = ?");
        $stmt->execute([$phone]);
        $client = $stmt->fetch();

        if ($client) {
            $client_id = $client['id'];
        } else {
            $stmt = $pdo->prepare("INSERT INTO clients (client_name, phone) VALUES (?, ?)");
            $stmt->execute([$name, $phone]);
            $client_id = $pdo->lastInsertId();
        }

        // نشوف الـ service_id من جدول الخدمات
        $stmt = $pdo->prepare("SELECT id FROM services WHERE service_name = ?");
        $stmt->execute([$service]);
        $service_row = $stmt->fetch();
        $service_id = $service_row['id'];

        // نحط الحجز
        $stmt = $pdo->prepare("INSERT INTO bookings (client_id, service_id, booking_date, notes) VALUES (?, ?, ?, ?)");
        $stmt->execute([$client_id, $service_id, $date, $notes]);

        $stmt = null;
        $pdo  = null;

        
        $_SESSION['last_booking'] = [
            'name'    => $name,
            'service' => $service,
            'date'    => $date,
            'phone'   => $phone,
        ];
    } catch (PDOException $e) {
        die("Query failed: " . $e->getMessage());
    }
}
?>