<?php
	require_once "defaultincludes.inc";
	require_once "lib/PHPMailer/PHPMailerAutoload.php";

	if(isset($_GET['para'])){
		$email=base64_decode($_GET['para']);
 		$db=mysqli_connect($db_host,$db_login,$db_password,$db_database,$db_port);
 		if(!$db){
 			die("連接失敗" .mysqli_connect_error());
 		}
 		$sql="select a.accountstatus accountstatus, b.timesstamp timesstamp from mrbs_users a join mrbs_users_valid b ON a.email=b.email where a.email='$email'";
        $result=mysqli_query($db,$sql);
        if(mysqli_num_rows($result)>0){
            $email_hash=base64_encode($email);
        	$row=mysqli_fetch_assoc($result);
        	if($row['accountstatus']==0){
                $time=strtotime($row['timesstamp']);
                $now=time();
                //$timestamp = date("Y-m-d H:i:s");
        		if($now-$time>300){  //五分鐘內有效
                    $sql="DELETE FROM mrbs_users_valid WHERE email='$email'";
                    mysqli_query($db, $sql);
                    //strat--email function可以用後start到end標住起來的地方要刪掉
                    $sql="INSERT INTO mrbs_users_valid (email)
                              VALUES('$email')";
                    mysqli_query($db, $sql);
                    //end--刪到這
                    echo "連結已失效，請重新整理或到信箱收取驗證信重新啟用帳號";//連結失效的情況下
        			//更改收件者郵件與內容
                    $mail = new PHPMailer;

                     //$mail->SMTPDebug = 3;                               // Enable verbose debug output

                    $mail->isSMTP();                                      // Set mailer to use SMTP
                    $mail->Host = $smtp_settings['host'];  // Specify main and backup SMTP servers
                    $mail->SMTPAuth = $smtp_settings['auth'];                               // Enable SMTP authentication
                    $mail->Username = $smtp_settings['username'];                 // SMTP username
                    $mail->Password = $smtp_settings['password'];                           // SMTP password
                    $mail->SMTPSecure = $smtp_settings['secure'];                            // Enable TLS encryption, `ssl` also accepted
                    $mail->Port = $smtp_settings['port'];                                    // TCP port to connect to

                    $mail->setFrom($smtp_settings['from'], $smtp_settings['username']);
                    $mail->addAddress($email, 'Receiver');     // Add a recipient
                    //$mail->addAddress('ellen@example.com');               // Name is optional
                    //$mail->addReplyTo('info@example.com', 'Information');
                    //$mail->addCC('cc@example.com');
                    //$mail->addBCC('bcc@example.com');

                    //$mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
                    //$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name
                    $mail->isHTML(true);                                  // Set email format to HTML

                    $mail->Subject = 'NCU_MRBS_Verification';
                    $mail->Body    = "Thank you for creating an NCU Booking System account.".
                                      "<br/>".
                                      "Before you can use the system, you must activate your account with following link.".
                                      "<br/>".
                                      "<a href=http://booking.ncu.edu.tw/activate.php?para=$email_hash"." target=_blank>按此啟用帳號</a>".
                                      "<br/>".
                                      "Once you complete activation, you can log in and update your profile.".
                                      "<br/>".
                                      "If you have any issues or questions, Contact NCU Curriculum Division.";
                    //$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

                    if(!$mail->send()) {
                        echo 'Message could not be sent. Please contact administrator';
                        //echo 'Mailer Error: ' . $mail->ErrorInfo;
                    } else {
                        echo 'Message has been sent';
                    }
        		}
        		elseif($now-$time<=300){
        			$sql="update mrbs_users set accountstatus = '1' where email = '$email'";
        			mysqli_query($db, $sql);
                    $sql="DELETE FROM mrbs_users_valid WHERE email='$email'";
                    mysqli_query($db, $sql);
        			echo "帳號成功開通";//正常的情況下
        		}
        	}
        	elseif($row['accountstatus']==1){
        		echo "帳號已經開通";//避免已經開通了還是重複點驗證信
        	}
        }
        else{
        	echo "error code:305";//參數有誤
        }
        mysqli_close($db);
	}
	else{
		echo "error code:306";//抓不到參數名稱
	}
?>

