const footerTemplate = `
<footer class="fstyle">
  <div style="display: flex; justify-content: center; gap: 15px; margin-bottom: 25px;">
    <a href="https://www.tiktok.com/@_its.roon?_r=1&_t=ZS-95yrO4bSDxc" target="_blank" class="social-circle"><img src="emoji/tiktok.png" width="40px" alt="TikTok"></a>
    <a href="https://www.facebook.com/share/1DTxmiewiL/?mibextid=wwXIfr" target="_blank" class="social-circle"><img src="emoji/facebook.png" width="35px" alt="Facebook"></a>
    <a href="https://www.instagram.com/_its.roon?igsh=MW9jczhuem5hbTFleQ==" target="_blank" class="social-circle"><img src="emoji/instagram.png" width="40px" alt="Instagram"></a>
  </div>
  <div>
    جميع حقوق النشر © محفوظة ل جلويك بيوتي سنتر
  </div>
  <a href="#" id="scrollTopBtn" onclick="window.scrollTo({top: 0, behavior: 'smooth'}); return false;">↑</a>
</footer>
`;

document.getElementById('footer-placeholder').innerHTML = footerTemplate;

window.onscroll = function() {
  const btn = document.getElementById('scrollTopBtn');
  if (btn) {
    if (document.body.scrollTop > 300 || document.documentElement.scrollTop > 300) {
      btn.classList.add("show-btn");
    } else {
      btn.classList.remove("show-btn");
    }
  }
};