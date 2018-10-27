 <?php
    //require "defaultincludes.inc";
    require_once "phpmailer/class.phpmailerinc.php";
    $errors=array();
    //
    $db = mysqli_connect($db_host,$db_login,$db_password,$db_database,$db_port);
    if(!$db){
      die("連接失敗: ". mysqli_connect_error());
    }
    if(isset($_POST['register'])){
      $username=mysqli_real_escape_string($db,$_POST['username']);
 	    $email=mysqli_real_escape_string($db,$_POST['email']);
 	    $phone=mysqli_real_escape_string($db,$_POST['phone']);
 	    $password_1=mysqli_real_escape_string($db,$_POST['password_1']);
      $password_2=mysqli_real_escape_string($db,$_POST['password_2']);
      $studentID= substr(mysqli_real_escape_string($db,$_POST['email']),9);
      //if error, push to errors array
      if(empty($username)){
        array_push($errors, "請輸入姓名");
 	    }
 	    if(empty($email)){
        array_push($errors, "請輸入學校信箱");
 	    }
 	    else{
        if(!preg_match('/^\w+((-\w+)|(\.\w+))*\@cc\.ncu\.edu.tw$/', $email)){
          array_push($errors, "信箱格式應為學號+@cc.ncu.edu.tw");
 	  	  }
 	    }
 	    if(empty($phone)){
        array_push($errors, "請輸入手機號碼");
 	    }
 	    if(empty($password_1)){
        array_push($errors, "請輸入密碼");
 	    }
 	    else{
        if (strlen($password_1) <= '5') {
          array_push($errors, "密碼長度至少為6位元");
   	 	  }
   		  elseif(!preg_match("#[0-9]+#",$password_1)) {
          array_push($errors, "密碼至少要包含1個數字");
    	  }
   		  elseif(!preg_match("#[a-z]+#",$password_1)) {
          array_push($errors, "密碼至少包含1個英文字母");
   		  }	
   		  elseif ($password_1 != $password_2) {
          array_push($errors, "密碼兩次輸入不同");
   		  }
 	    }
    
      //if no error, insert into db
 	    if(count($errors)==0){
        $password_1=md5($password_1);
        // $timestamp = date("Y-m-d H:i:s");
      //若已有資料則判斷status，否則新增一筆
        $sql="SELECT accountstatus from mrbs_users where email='$email'";
        $result=mysqli_query($db,$sql);
        if(mysqli_num_rows($result)>0){
          $row=mysqli_fetch_assoc($result);
          if($row['accountstatus']==0){
            $sql="DELETE from mrbs_users where email='$email'";
            mysqli_query($db, $sql);
            $sql="INSERT INTO mrbs_users (level, name, email, phone, password_hash, accountstatus, studentID)
                     VALUES('1','$username', '$email', '$phone', '$password_1', '0','$studentID' )";
            mysqli_query($db, $sql);
            //
            $sql="INSERT INTO mrbs_users_valid (email, timesstamp)
                       VALUES('$email', '$timestamp')" or die(mysqli_error());
            mysqli_query($db, $sql);
            $info='*已成功註冊，請到信箱收取驗證信來啟用帳號<br/>5秒後重新導向至登入頁面';
            header("Refresh: 5;URL='$web_host'");
           /* if(!$mail->Send()){
                $info = "Error: " . $mail->ErrorInfo;
            }
            else{
                $sql="INSERT INTO mrbs_users_valid (email, timesstamp)
                       VALUES('$email', '$timestamp')" or die(mysqli_error());
                mysqli_query($db, $sql);
                $info='*已成功註冊，請到信箱收取驗證信來啟用帳號<br/>5秒後重新導向至登入頁面';
                header("Refresh: 5;URL='$web_host'");
            }*/
          }
          elseif($row['accountstatus']==1){
            $info='*帳號已被註冊';
          }
        }
        else{
          //$sql="INSERT INTO mrbs_users (level, name, email, phone, password_hash, accountstatus, studentID)
                  // VALUES('1','$username', '$email', '$phone', '$password_1', '0', '$studentID')";
          //mysqli_query($db, $sql);
          //
          //$sql="INSERT INTO mrbs_users_valid (email, timesstamp)
                       // VALUES('$email', '$timestamp')" or die(mysqli_error());
          //mysqli_query($db, $sql);
          header("Refresh: 5;URL='$web_host'");
          $info ='111已成功註冊，請到信箱收取驗證信來啟用帳號<br/>5秒後重新導向至登入頁面';
          
          /*if(!$mail->Send()){
                $info = "Error: " . $mail->ErrorInfo;
            }
          else{
                $sql="INSERT INTO mrbs_users_valid (email, timesstamp)
                        VALUES('$email', '$timestamp')" or die(mysqli_error());
                mysqli_query($db, $sql);
                $info ='已成功註冊，請到信箱收取驗證信來啟用帳號<br/>5秒後重新導向至登入頁面';
                header("Refresh: 5;URL='$web_host'");
          }*/
          
        }
 		  }
    }
    mysqli_close($db);
 ?>

