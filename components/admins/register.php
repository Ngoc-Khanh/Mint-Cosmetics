<?php
    $level_sidebar = '';
    $level_header = '';
    $level_footer = '';
?>

<!DOCTYPE html>
<html>

<head>
    <title>Admin - Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href=<?php echo $level_header . _DIR_['CSS']['ADMINS'] . 'adminlogin.css' ?>>
</head>

<body>

    <?php
        if (!empty($register_err)) {
        ?>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <?php echo $register_err; ?>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        <?php
        }
    ?>

    <img class="wave" src=<?php echo $level_sidebar . _DIR_['IMG']['ADMINS'] . 'wave.png' ?>>
    <div class="container">
        <div class="img">
            <img src=<?php echo $level_sidebar . _DIR_['IMG']['ADMINS'] . 'bg.svg' ?>>
        </div>
        <div class="login-content">
            <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]) ?>" method="post" id="login_form">
                <img src=<?php echo $level_sidebar . _DIR_['IMG']['ADMINS'] . 'avatar.svg' ?>>
                <h2 class="title" style="font-size: 35px;">Admin - Register</h2>
                <!-- Username -->
                <div class="input-div user <?php echo (!empty($user_err)) ? 'has-error' : '' ;?>">
                    <div class="i">
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="div">
                        <h5>Username</h5>
                        <input name="username" type="text" class="input" required autofocus>
                    </div>
                </div>
                <div class="text-danger"><?php echo $user_err; ?></div>
                <!-- Email -->
                <div class="input-div email">
                    <div class="i">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <div class="div">
                        <h5>Email</h5>
                        <input name="email" type="email" class="input" required autofocus>
                    </div>
                </div>
                <div class="text-danger"><?php echo $email_err; ?></div>
                <!-- Password -->
                <div class="input-div pass">
                    <div class="i">
                        <i class="fas fa-lock"></i>
                    </div>
                    <div class="div">
                        <h5>Password</h5>
                        <input name="password" type="password" class="input <?php empty($pass_err) ? 'has-error' : '' ;?>" required>
                    </div>
                </div>
                <div class="text-danger"><?php echo $pass_err; ?></div>
                <!-- Confirm Password -->
                <div class="input-div pass">
                    <div class="i">
                        <i class="fas fa-lock"></i>
                    </div>
                    <div class="div">
                        <h5>Password</h5>
                        <input name="confirm_password" type="password" class="input <?php empty($confirm_pass_err) ? 'has-error' : '' ;?>" required>
                    </div>
                </div>
                <div class="text-danger"><?php echo $confirm_pass_err; ?></div>
                <a href="admin_login.php">Đã có tài khoản</a>
                <button type="submit" class="btn" name="login">Register</button>
            </form>
        </div>
    </div>
</body>
<script src=<?php echo $level_footer . _DIR_['JS']['ADMINS'] . 'adminlogin.js' ?>></script>

</html>