<?php 
namespace MRBS;
require "defaultincludes.inc";
include('server.php');
//use MRBS\Form\Form;

print_header();
?>
<!DOCTYPE html>
<html>
  <head>
    <title>註冊</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="css/awesomplete.css" />
    <script src="js/awesomplete.js"></script>
    <!--<script type="text/javascript">
      function delayedRedirect(){
        window.location="admin.php";
      }
    </script>-->
  </head>
  <body>
    <div class="header">
      <h2>註冊</h2>
    </div>
    <form method="post" action="register.php" class="forform">
      <?php include('error.php'); ?>
      <div class="input-group">
        <label>姓名</label>
        <input type="text" name="username" maxlength="10" value="<?php echo $username; ?>">
      </div>
      <div class="input-group">
        <label>學校信箱</label>
        <input type="text" name="email" ID="email" placeholder="請輸入信箱" maxlength="50" value="<?php echo $email; ?>">
      </div>
            <script>
                new Awesomplete('input[name="email"]', {
                    list: ["cc.ncu.edu.tw"],
                    data: function (text, input) {
                        return input.slice(0, input.indexOf("@")) + "@" + text;
                    },
                    filter: Awesomplete.FILTER_STARTSWITH
                });
            </script>
      <div class="input-group">
        <label>電話</label>
        <input type="text" name="phone" placeholder="請輸入手機號碼" maxlength="10" value="<?php echo $phone; ?>">
      </div>
      <div class="input-group">
        <label>密碼</label>
        <input type="password" name="password_1" maxlength="20">
      </div>
      <div class="input-group">
        <label>確認密碼</label>
        <input type="password" name="password_2" maxlength="20">
      </div>
      <div class="input-group">
        <button type="submit" name=register class="btn">註冊</button>
      </div>
      <?php include('info.php'); ?>
    </form>
  </body>
</html>

<?php
output_trailer();
?>