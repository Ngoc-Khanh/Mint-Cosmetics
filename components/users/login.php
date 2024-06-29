<div class="warpper">
    <?php
    if (!empty($login_err)) {
    ?>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <?php echo $login_err; ?>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    <?php
        $login_err = "";
    }
    ?>
    <form id="loginForm" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" autocomplete="off">
        <h1>Login</h1>
        <!-- Email -->
        <div class="input-box <?php echo (!empty($email_err)) ? 'has-error' : ''; ?>">
            <input type="text" name="email" placeholder="Email" required>
            <i class='bx bxs-user'></i>
            <div class="text-danger"><?php echo $email_err; ?></div>
        </div>
        <!-- Password -->
        <div class="input-box <?php echo (!empty($email_err)) ? 'has-error' : ''; ?>">
            <input type="password" name="pass" placeholder="Password" required>
            <i class='bx bxs-lock'></i>
            <div class="text-danger"><?php echo $pass_err; ?></div>
        </div>

        <div class="remember-forgot">
            <label><input type="checkbox"> Remember me</label>
            <a href="#">Quên mật khẩu</a>
        </div>

        <input type="submit" value="Đăng nhập" class="btn">

        <div class="register-link">
            <p>Chưa có tài khoản? <a href="user_register.php">Đăng ký</a></p>
        </div>
    </form>
</div>