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
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMIdiRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <title>註冊</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMIdiRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <!--link rel="stylesheet" type="text/css" href="css/style.css"-->
    <!--link rel="stylesheet" href="css/awesomplete.css" /-->
    <script src="js/awesomplete.js"></script>
    <!--<script type="text/javascript">
      function delayedRedirect(){
        window.location="admin.php";
      }
    </script>-->
  </head>
  <body>
    <div class="container text-center border border-info rounded bg-secondary" style="width:40%">
      <h2 class="text-light">註冊</h2>
    </div>
    <div class="container bg-white border-right border-bottom border-left border-info rounded" style="width:40%">
      <form method="post" action="register.php" class="form-group">
        <?php include('error.php'); ?>
        <div class="form-group row">
          <label for="username" class="col-sm-3 col-form-label">姓名</label>
          <div class="col-sm-7">
            <input type="text" class="form-control" name="username" maxlength="10" value="<?php echo $username; ?>">
          </div>
        </div>
        <div class="form-group row">
          <label for="email" class="col-sm-3 col-form-label">學校信箱</label>
          <div class="col-sm-7">
            <input type="email" class="form-control" name="email" ID="email" placeholder="@cc.ncu.edu.tw" maxlength="50" value="<?php echo $email; ?>">
          </div>
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
        <div class="form-group row">
          <label for="phone" class="col-sm-3 col-form-label">電話</label>
          <div class=col-sm-7>
            <input type="text" class="form-control" name="phone" placeholder="請輸入手機號碼" maxlength="10" value="<?php echo $phone; ?>">
          </div>
        </div>
        <div class="form-group row">
          <label for="password_1" class="col-sm-3 col-form-label">密碼</label>
          <div class=col-sm-7>
            <input type="password" class="form-control" placeholder="請輸入密碼" name="password_1" maxlength="20">
          </div>
        </div>
        <div class="form-group row">
          <label for="password_2" class="col-sm-3 col-form-label">確認密碼</label>
          <div class="col-sm-7">
            <input type="password" class="form-control" placeholder="請再次輸入密碼" name="password_2" maxlength="20">
          </div>
        </div>
        <div class="form-group row">
          <div class="col-sm-10">
            <button type="submit" class="btn btn-primary" name=register>註冊</button>
          </div>
        </div>
        <?php include('info.php'); ?>
      </form>
    </div>
  </body>
</html>

<?php
output_trailer();
?>