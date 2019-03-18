<?php
	require_once "defaultincludes.inc";
	require_once "lib/PHPMailer/PHPMailerAutoload.php";
    require_once "functions_mail.inc";

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
        		if($now-$time>1800){  //五分鐘內有效
                    $sql="DELETE FROM mrbs_users_valid WHERE email='$email'";
                    mysqli_query($db, $sql);
                    //strat--email function可以用後start到end標住起來的地方要刪掉
                    $sql="INSERT INTO mrbs_users_valid (email)
                              VALUES('$email')";
                    mysqli_query($db, $sql);
                    //end--刪到這
                    echo "連結已失效，請重新整理或到信箱收取驗證信重新啟用帳號";//連結失效的情況下
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

                    $mail->setFrom($mail_settings['from'], 'no-reply');
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
        	    elseif($now-$time<=1800){
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

