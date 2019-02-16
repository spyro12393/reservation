 <?php
    require_once "defaultincludes.inc";
    require_once "lib/PHPMailer/PHPMailerAutoload.php";
    require_once "functions_mail.inc";

    function randtext($length) {
      $password_len = $length;    //字串長度
      $password = '';
      $word = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';   //亂數內容
      $len = strlen($word);
      for ($i = 0; $i < $password_len; $i++) {
          $password .= $word[rand() % $len];
      }
      return $password;
    }

    $errors=array();
    //
    $db = mysqli_connect($db_host,$db_login,$db_password,$db_database,$db_port);
    if(!$db) {
      die("連接失敗: ". mysqli_connect_error());
    }
    if(isset($_POST['register'])) {
      $username=mysqli_real_escape_string($db,$_POST['username']);
 	    $email=mysqli_real_escape_string($db,$_POST['email']);
 	    $phone=mysqli_real_escape_string($db,$_POST['phone']);
 	    $password_1=mysqli_real_escape_string($db,$_POST['password_1']);
      $password_2=mysqli_real_escape_string($db,$_POST['password_2']);
      $studentID= substr(mysqli_real_escape_string($db,$_POST['email']),0,9);//
      //if error, push to errors array
      if(empty($username)) {
        array_push($errors, "請輸入姓名");
 	    }
      if(empty($email)) {
        array_push($errors, "請輸入學校信箱");
 	    }
 	    else {
        if(!preg_match('/^\w+((-\w+)|(\.\w+))*\@cc\.ncu\.edu.tw$/', $email)) {
          array_push($errors, "信箱格式應為學號+@cc.ncu.edu.tw");
 	  	  }
 	    }
      if(empty($phone)) {
        array_push($errors, "請輸入手機號碼");
 	    }
 	    if(empty($password_1)) {
        array_push($errors, "請輸入密碼");
 	    }
 	    else {
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
 	    if(count($errors)==0) {
        $password_1=md5($password_1);
        $email_hash=base64_encode($email);
        //$timestamp = date("Y-m-d H:i:s"); DB有預設了
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
            $sql="INSERT INTO mrbs_users_valid (email)
                        VALUES('$email')";
            mysqli_query($db, $sql);
            $info='*已成功註冊，請到信箱收取驗證信來啟用帳號<br/>5秒後重新導向至首頁';
            header("Refresh: 5;URL='$web_host'");
            
            $mail = new PHPMailer;
            $mail->isSMTP();
            $mail->Host = $smtp_settings['host'];
            $mail->Port = $smtp_settings['port'];
            $mail->SMTPAuth = $smtp_settings['auth'];
            $mail->SMTPSecure = $smtp_settings['secure'];
            $mail->Username = $smtp_settings['username'];
            $mail->Password = $smtp_settings['password'];
            if ($smtp_settings['disable_opportunistic_tls']) {
              $mail->SMTPAutoTLS = false;
            }

            $mail->SMTPOptions = array
            (
              'ssl' => array
              (
                'verify_peer' => $smtp_settings['ssl_verify_peer'],
                'verify_peer_name' => $smtp_settings['ssl_verify_peer_name'],
                'allow_self_signed' => $smtp_settings['ssl_allow_self_signed']
              )
            );

            $mail->setFrom('no-reply@mail.ncuisq.tk', 'no-reply');
            $mail->addAddress($email, 'Receiver');     // Add a recipient
            $mail->isHTML(true);                       // Set email format to HTML

            //$mail->charset='UTF-8';
            $mail->Subject = 'NCU_MRBS_Verification';
            $mail->Body    = "Thank you for creating an NCU Booking System account.".
                              "<br/>".
                              "Before you can use the system, you must activate your account with following link.".
                              "<br/>".
                              "<a href=http://booking.ncu.edu.tw/activate.php?para=$email_hash"." target=_blank>Click Link To Activate Account</a>".
                              "<br/>".
                              "Once you complete activation, you can log in and update your profile.".
                              "<br/>".
                              "If you have any issues or questions, Contact NCU Curriculum Division.";
            if(!$mail->send()) {
              array_push($errors, "Message could not be sent. Please contact administrator");
            } 
            else {
              $info.='<br/>'.'Message has been sent';
            }
          }
          elseif($row['accountstatus']==1) {
            $info='*帳號已被註冊';
          }
        }
        else {
          $sql="INSERT INTO mrbs_users (level, name, email, phone, password_hash, accountstatus, studentID)
                   VALUES('1','$username', '$email', '$phone', '$password_1', '0', '$studentID')";
          mysqli_query($db, $sql);         

          $sql="INSERT INTO mrbs_users_valid (email)
                        VALUES('$email')";
          mysqli_query($db, $sql);

          $info ='已成功註冊，請到信箱收取驗證信來啟用帳號<br/>5秒後重新導向至首頁';
          header("Refresh: 5;URL='$web_host'");
          
          $mail = new PHPMailer;
            $mail->isSMTP();
            $mail->Host = $smtp_settings['host'];
            $mail->Port = $smtp_settings['port'];
            $mail->SMTPAuth = $smtp_settings['auth'];
            $mail->SMTPSecure = $smtp_settings['secure'];
            $mail->Username = $smtp_settings['username'];
            $mail->Password = $smtp_settings['password'];
            if ($smtp_settings['disable_opportunistic_tls']) {
              $mail->SMTPAutoTLS = false;
            }

            $mail->SMTPOptions = array
            (
              'ssl' => array
              (
                'verify_peer' => $smtp_settings['ssl_verify_peer'],
                'verify_peer_name' => $smtp_settings['ssl_verify_peer_name'],
                'allow_self_signed' => $smtp_settings['ssl_allow_self_signed']
              )
            );

            $mail->setFrom('no-reply@mail.ncuisq.tk', 'no-reply');
            $mail->addAddress($email, 'Receiver');     // Add a recipient
            $mail->isHTML(true);                       // Set email format to HTML

            //$mail->charset='UTF-8';
            $mail->Subject = 'NCU_MRBS_Verification';
            $mail->Body    = "Thank you for creating an NCU Booking System account.".
                              "<br/>".
                              "Before you can use the system, you must activate your account with following link.".
                              "<br/>".
                              "<a href=http://booking.ncu.edu.tw/activate.php?para=$email_hash"." target=_blank>Click Link To Activate Account</a>".
                              "<br/>".
                              "Once you complete activation, you can log in and update your profile.".
                              "<br/>".
                              "If you have any issues or questions, Contact NCU Curriculum Division.";
            if(!$mail->send()) {
              array_push($errors, "Message could not be sent. Please contact administrator");
            } 
            else {
              $info.='<br/>'.'Message has been sent';
            }
        }
 		  }
    }
    else { // reset password
 	    $email=mysqli_real_escape_string($db,$_POST['email']);
 	    $phone=mysqli_real_escape_string($db,$_POST['phone']);
      if(empty($email)) {
        array_push($errors, "請輸入學校信箱");
 	    }
 	    else {
        if(!preg_match('/^\w+((-\w+)|(\.\w+))*\@cc\.ncu\.edu.tw$/', $email)) {
          array_push($errors, "信箱格式應為學號+@cc.ncu.edu.tw");
 	  	  }
 	    }
      if(empty($phone)) {
        array_push($errors, "請輸入手機號碼");
       }

      if(count($errors)==0) {
        $rand_pwd = randtext(8);
        $password_1=md5($rand_pwd); // random a new password
        $email_hash=base64_encode($email);

        //若已有資料則判斷status，否則新增一筆
        $sql="SELECT accountstatus from mrbs_users where email='$email' and phone='$phone'";
        $result=mysqli_query($db,$sql);

        if(mysqli_num_rows($result)>0){
          $row=mysqli_fetch_assoc($result);

          $sql="UPDATE mrbs_users set password_hash = '$password_1' where email='$email'";
          if (mysqli_query($db, $sql)) {
            $info='New Password:['. $rand_pwd . ']';
          } else {
            echo "Error updating record: " . mysqli_error($conn);
          }

          header("Refresh: 5;URL='$web_host'");
          
          $mail = new PHPMailer;
          $mail->isSMTP();
          $mail->Host = $smtp_settings['host'];
          $mail->Port = $smtp_settings['port'];
          $mail->SMTPAuth = $smtp_settings['auth'];
          $mail->SMTPSecure = $smtp_settings['secure'];
          $mail->Username = $smtp_settings['username'];
          $mail->Password = $smtp_settings['password'];
          if ($smtp_settings['disable_opportunistic_tls']) {
            $mail->SMTPAutoTLS = false;
          }

          $mail->SMTPOptions = array
          (
            'ssl' => array
            (
              'verify_peer' => $smtp_settings['ssl_verify_peer'],
              'verify_peer_name' => $smtp_settings['ssl_verify_peer_name'],
              'allow_self_signed' => $smtp_settings['ssl_allow_self_signed']
            )
          );

          $mail->setFrom('no-reply@mail.ncuisq.tk', 'no-reply');
          $mail->addAddress($email, 'Receiver');     // Add a recipient
          $mail->isHTML(true);                       // Set email format to HTML

          //$mail->charset='UTF-8';
          $mail->Subject = 'NCU_MRBS_Reset_Password';
          $mail->Body    = "Your new password is [". $rand_pwd ."]";

          if(!$mail->send()) {
            array_push($errors, "Message could not be sent. Please contact administrator");
          } 
          else {
            $info.='<br/>'.'New password has been sent to your email';
          }
          
        }
        else {
          array_push($errors, "無此帳戶");
        }
      }




    }
    mysqli_close($db);
 ?>

