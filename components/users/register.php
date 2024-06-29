<div class="warpper">
    <?php
    if (!empty($register_err)) {
    ?>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <?php echo $login_err; ?>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    <?php
        $register_err = "";
    }
    ?>
    <form id="registerForm" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="POST" autocomplete="off">
        <h1>Register</h1>
        <!-- Name -->
        <div class="input-box">
            <input type="text" name="name" id="name" placeholder="Name" required>
            <i class='bx bxs-user'></i>
        </div>
        <div class="text-danger help-block"><?php echo $name_err; ?></div>
        <!-- Email -->
        <div class="input-box">
            <input type="email" name="email" id="email" placeholder="Email" required>
            <i class='bx bxs-user'></i>
        </div>
        <div class="text-danger"><?php echo $email_err; ?></div>
        <!-- Phone -->
        <div class="input-box">
            <input type="text" name="phone" id="phone" placeholder="Phone" required>
            <i class='bx bxs-envelope'></i>
        </div>
        <div class="text-danger"><?php echo $phone_err; ?></div>
        <!-- Password -->
        <div class="input-box">
            <input type="password" name="password" id="password" placeholder="Password" required>
            <i class='bx bxs-lock'></i>
        </div>
        <div class="text-danger"><?php echo $pass_err; ?></div>
        <!-- Comfirm Password -->
        <div class="input-box">
            <input type="password" name="confirm_password" id="confirm_password" placeholder="Confirm Password" required>
            <i class='bx bxs-lock'></i>
        </div>
        <div class="text-danger"><?php echo $confirm_pass_err; ?></div>

        <input type="submit" value="Đăng ký" class="btn">

        <div class="register-link">
            <p>Bạn đã có tài khoản? <a href="user_login.php">Đăng nhập</a></p>
        </div>
    </form>
</div>