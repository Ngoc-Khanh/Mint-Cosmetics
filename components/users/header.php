<!-- ****** Header Area Start ****** -->
<link href=<?php echo _DIR_['CSS']['USERS'] . 'header.css' ?> rel="stylesheet" />
<div class="wrapper">
    <header>
        <input type="checkbox" name="" id="toggler">
        <label for="toggler" class="fas fa-bars"></label>
        <a href="index.php" class="logo"><img src=<?php echo _DIR_['IMG']['USERS'] . 'core-img/' . 'logo.png'; ?> alt="Mint Cosmetics Logo" class="logo"></a>

        <nav class="navbar">
            <a href="index.php#home">Trang chủ</a>
            <a href="index.php#about">Về Mint</a>
            <a href="index.php#product">Sản phẩm</a>
            <a href="index.php#review">Đánh giá</a>
            <a href="index.php#contact">Liên hệ</a>
        </nav>

        <div class="icons">
            <a href="user_cart.php" class="fas fa-shopping-cart"></a>
            <div class="dropdown">
                <button onclick="toggleDropdown()" class="fas fa-user dropbtn"></button>
                <div id="dropdown-content" class="dropdown-content">
                    <?php
                    if (!isset($_SESSION["isUserLoggedIn"]) || $_SESSION["isUserLoggedIn"] === false) {
                    ?>
                        <a href="user_login.php" style="font-size: 1.75rem;">Đăng nhập</a>
                        <a href="user_register.php" style="font-size: 1.75rem;" onclick="logout()">Đăng ký</a>
                    <?php
                    } else {
                    ?>
                        <a href="user_info.php" style="font-size: 1.75rem;">

                            <?php
                            if ($_SESSION["photo"] == "image.jpg") {
                            ?>
                                <img width="50" height="50" style="border-radius: 50%; -moz-border-radius: 50%; -webkit-border-radius: 50%;" src=<?php echo _DIR_['IMG']['USERS'] . 'info/image.jpg'; ?>>
                            <?php
                            } else {
                            ?>
                                <img width="50" height="50" style="border-radius: 50%; -moz-border-radius: 50%; -webkit-border-radius: 50%;" src=<?php echo _DIR_['IMG']['USERS'] . 'info/' . $_SESSION["photo"]; ?>>
                            <?php
                            }
                            ?>
                            <br>Chào, <?php echo $_SESSION["name"]; ?>
                        </a>
                        <a href="user_logout.php" style="font-size: 1.75rem;" onclick="logout()">Đăng xuất</a>
                    <?php
                    }
                    ?>
                </div>
            </div>
        </div>

    </header>
    <!-- ****** Header Area End ****** -->
</div>