<?php
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    require_once 'booking.php';
}
?>
<!doctype html>
<html lang="ar" dir="rtl">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="keywords" content="Beuty Center, Glowik beauty Center, makeup, beauty" />
    <title>Glowik Beauty Center - احجزي معانا</title>
    <link rel="stylesheet" href="css/style.css" />
  </head>
  <body>
    <div id="header-placeholder"></div>
    <script src="javascript/header.js"></script>

    <main>
      <div class="reserve-container">
        <h1>احجزي موعدك معانا</h1>
        <p>احجزي في الموعد اللي يناسبك عشان نقدر نخدمك من قلبنا</p>

        <?php if (isset($_SESSION['last_booking'])): ?>
          <?php $b = $_SESSION['last_booking']; unset($_SESSION['last_booking']); ?>
          <div class="success-message">
            <p>تم حجزك بنجاح يا <?= htmlspecialchars($b['name']) ?>!</p>
          </div>
        <?php endif; ?>

        <form class="booking-form" action="" method="post">
          <div class="form-group">
            <label for="name">الاسم بالكامل</label>
            <input type="text" id="name" name="name" placeholder="اكتبي الاسم بالكامل هنا" required />
          </div>

          <div class="form-group">
            <label for="phone">موبايلك</label>
            <input type="tel" id="phone" name="phone" placeholder="01xxxxxxxxx" required />
          </div>

          <div class="form-group">
            <label for="service">الخدمة</label>
            <select id="service" name="service" required>
              <option value="">اختاري الخدمة</option>
              <option value="hair_cut">💇‍♀️ قص شعر</option>
              <option value="hair_styling">💁‍♀️ تسريح شعر</option>
              <option value="hair_coloring">🖌️ صبغ شعر</option>
              <option value="hair_treatment">🧴 علاج شعر</option>
              <option value="makeup_normal">💄 مكياج</option>
              <option value="makeup_bridal">👰 مكياج عروس</option>
              <option value="facial_cleaning">🧼 تنظيف بشرة</option>
              <option value="hydrafacial">💧 هايدروفيشال</option>
              <option value="derma_pen">✍️ درما بن</option>
              <option value="skin_brightening">✨ تبييض بشرة</option>
              <option value="manicure">💅 مانيكير</option>
              <option value="pedicure">🦶 بيديكير</option>
              <option value="gel_nails">💎 جل نيلز</option>
              <option value="acrylic_nails">💅 acrylic أكريليك</option>
              <option value="nail_art">🎨 نيل آرت</option>
            </select>
          </div>

          <div class="form-group">
            <label for="date"><img src="emoji/calendar.png" width="23px"> تاريخ الحجز</label>
            <input type="date" name="date" id="date" required />
          </div>

          <div class="form-group full-width">
            <label for="notes"><img src="emoji/note.png" width="25px"> طلبات خاصة وملاحظات</label>
            <textarea id="notes" name="notes" rows="4"
              placeholder="اكتبي اي ملاحظة تخصك من ناحية اذا عندك حساسية من مادة معينة عشان نعرف ازاي نخدمك...">
            </textarea>
          </div>

          <button type="submit" class="submit-btn">احجزي الآن</button>
        </form>
      </div>
    </main>

    <div id="footer-placeholder"></div>
    <script src="javascript/footer.js"></script>
  </body>
</html>