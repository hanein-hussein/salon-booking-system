// ===== فتح وغلق البوكس =====
function openModal(id) {
  document.getElementById(id).style.display = "flex";
}
function closeModal(id) {
  document.getElementById(id).style.display = "none";
}
// ===== تعديل الحجز =====
async function submitEdit(bookingId) {
  const data = new URLSearchParams({
    id:           bookingId,
    service_id:   document.getElementById("edit_service_" + bookingId).value,
    booking_date: document.getElementById("edit_date_"    + bookingId).value,
    notes:        document.getElementById("edit_notes_"   + bookingId).value,
  });
  const res  = await fetch("edit.php", { method: "POST", body: data });
  const json = await res.json();

  alert(json.message);
  if (json.status === "success") location.reload();
}
// ===== حذف الحجز =====
async function confirmDelete(bookingId) {
  if (!confirm("هل انتي متأكدة من حذف الحجز؟")) return;

  const res  = await fetch("delete_booking.php", {
    method: "POST",
    body:   new URLSearchParams({ id: bookingId })
  });
  const json = await res.json();

  alert(json.message ?? "تم الحذف");
  if (json.status === "success") location.reload();
}