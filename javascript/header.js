const headerTemplate = `
<header class="navbar">
    <div class="logo">
       <a href="index.html"> <img src="assets/logo.png" alt="Glowik Logo"></a>
    </div>
    <nav>
        <ul class="nav-links">
            <li><a href="index.html">الصفحة الرئيسية</a></li>
            <li><a href="about.html">من نكون</a></li>
            <li><a href="reserve.php">احجزي معانا</a></li>
            <li><a href="search.php">تأكدي من حجزك</a></li>
            <li><a href="contact.html">شرفينا بالاتصال</a></li>
        </ul>
    </nav>
</header>
`;

document.getElementById('header-placeholder').innerHTML = headerTemplate;