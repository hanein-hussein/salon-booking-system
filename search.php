<?php
require_once 'helpers.php';

$bookings = [];
$error    = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $phone = trim($_POST['phone'] ?? '');
  if (!$phone) {
    $error = "من فضلك ادخلي رقم الهاتف";
  } else {
    try {
      $bookings = getBookingsByPhone($pdo, $phone);
      if (!$bookings) $error = "لا يوجد حجوزات بهذا الرقم";
    } catch (PDOException $e) {
      $error = "حدث خطأ، حاولي تاني";
    }
  }
}

$services = getServices($pdo);
?>

<!doctype html>
<html lang="ar" dir="rtl">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Glowik Beauty Center - تابعي حجزك</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>

  <div id="header-placeholder"></div>
  <script src="javascript/header.js"></script>

  <main class="search-container">
    <h1>تابعي حجزك</h1>
    <p>ادخلي رقم هاتفك للتأكد من تفاصيل الحجز</p>

    <div class="search-box">
      <form method="POST" action="search.php">
        <div class="input-group">
          <label for="searchInput">رقم الهاتف</label>
          <input
            type="text"
            id="searchInput"
            name="phone"
            placeholder="01xxxxxxxxx"
            value="<?= htmlspecialchars($_POST['phone'] ?? '') ?>"
            required
          />
        </div>
        <button type="submit" class="search-btn">البحث عن الحجز</button>
      </form>

      <?php if ($error): ?>
        <p class="error"><?= $error ?></p>
      <?php endif; ?>

      <?php if ($bookings): ?>
        <h2><?= htmlspecialchars($bookings[0]['client_name']) ?></h2>

        <?php foreach ($bookings as $booking): ?>
          <?php $id = $booking['booking_id']; ?>
          <?php $editable = canEdit($booking['created_at']); ?>

          <div class="booking-card">
            <p>الخدمة: <?= htmlspecialchars($booking['service_name']) ?></p>
            <p>التاريخ: <?= htmlspecialchars($booking['booking_date']) ?></p>
            <p>الملاحظات: <?= htmlspecialchars($booking['notes'] ?? '') ?></p>
            <div class="actions">
              <?php if ($editable): ?>
                <button class="edit-btn"   onclick="openModal('edit_<?= $id ?>')">تعديل</button>
                <button class="delete-btn" onclick="confirmDelete(<?= $id ?>)">حذف</button>
              <?php else: ?>
                <a class="contact-btn" href="contact.html">تواصل معنا</a>
              <?php endif; ?>
            </div>
          </div>

          <!-- بوكس التعديل -->
          <?php if ($editable): ?>
          <div id="edit_<?= $id ?>" style="display:none; position:fixed;
           inset:0; background:rgba(0,0,0,0.5); justify-content:center; 
           align-items:center; z-index:999;">
            <div class="search-box" style="width:90%; max-width:450px;">
            <h3>تعديل الحجز</h3>

              <div class="input-group">
                <label>الخدمة</label>
                <select id="edit_service_<?= $id ?>">
                  <?php foreach ($services as $service): ?>
                    <option 
                      value="<?= $service['id'] ?>" 
                      <?= (int)$service['id'] === (int)$booking['service_id'] ? 'selected' : '' ?>
                    >
                      <?= htmlspecialchars($service['service_name']) ?>
                    </option>
                  <?php endforeach; ?>
                </select>
              </div>

              <div class="input-group">
                <label>التاريخ</label>
                <input type="datetime-local" id="edit_date_<?= $id ?>" value="<?= $booking['booking_date'] ?>" />
              </div>

              <div class="input-group">
                <label>الملاحظات</label>
                <textarea id="edit_notes_<?= $id ?>" rows="3"><?= htmlspecialchars($booking['notes'] ?? '') ?></textarea>
              </div>

              <div class="actions">
                <button class="search-btn" onclick="submitEdit(<?= $id ?>)">حفظ</button>
                <button class="contact-btn" onclick="closeModal('edit_<?= $id ?>')">إلغاء</button>
              </div>
            </div>
          </div>
          <?php endif; ?>

        <?php endforeach; ?>
      <?php endif; ?>
    </div>
  </main>

  <div id="footer-placeholder"></div>
  <script src="footer.js"></script>
  <script src="modal.js"></script>

</body>
</html>