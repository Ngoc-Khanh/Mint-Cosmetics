<?php
    $level_sidebar = '';
    $level_header = '';
    $level_footer = '';
?> 

<!DOCTYPE html>
<html>

<head>
    <title>Admin - Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href=<?php echo $level_header._DIR_['CSS']['ADMINS'].'adminlogin.css'?>>
</head>

<body>

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
    }
    ?>

    <img class="wave" src=<?php echo $level_sidebar._DIR_['IMG']['ADMINS'].'wave.png'?>>
    <div class="container">
        <div class="img">
            <img src=<?php echo $level_sidebar._DIR_['IMG']['ADMINS'].'bg.svg'?>>
        </div>
        <div class="login-content">
            <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]) ?>" method="post" id="login_form">
                <img src=<?php echo $level_sidebar._DIR_['IMG']['ADMINS'].'avatar.svg'?>>
                <h2 class="title">Admin - Login</h2>
                <div class="input-div one">
                    <div class="i">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <div class="div">
                        <h5>Email</h5>
                        <input name="email" type="email" class="input <?php empty($email_err) ? 'has-error' : ''; ?>" required autofocus>
                    </div>
                </div>
                <div class="text-danger"><?php echo $email_err ?></div>
                <div class="input-div pass">
                    <div class="i">
                        <i class="fas fa-lock"></i>
                    </div>
                    <div class="div">
                        <h5>Password</h5>
                        <input name="password" type="password" class="input <?php empty($pass_err) ? 'has-error' : ''; ?>" required>
                    </div>
                </div>
                <div class="text-danger"><?php echo $pass_err ?></div>
                <a href="admin_register.php">Chưa có tài khoản?</a>
                <button type="submit" class="btn" name="login">Login</button>
            </form>
        </div>
    </div>
</body>
<script src=<?php echo $level_footer._DIR_['JS']['ADMINS'].'adminlogin.js'?>></script>

</html>