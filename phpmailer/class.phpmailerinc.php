<?php
	require_once 'defaultincludes.inc';
    require_once 'phpmailer/class.phpmailer.php';
    //$C_name=$_POST['C_name'];
    //$C_email=$_POST['C_email'];
    //$C_tel=$_POST['C_tel'];
    //$C_message=$_POST['C_message'];
   
    $mail= new PHPMailer();                          //建立新物件
    $mail->IsSMTP();                                    //設定使用SMTP方式寄信
    $mail->SMTPAuth = true;                        //設定SMTP需要驗證
    $mail->SMTPSecure = "ssl";                    // Gmail的SMTP主機需要使用SSL連線
    $mail->Host = "smtp.gmail.com";             //Gamil的SMTP主機
    $mail->Port = 465;                                 //Gamil的SMTP主機的埠號(Gmail為465)。
    $mail->CharSet = "utf-8";                       //郵件編碼
    $mail->Username = "XXXX@gmail.com"; //Gamil帳號
    $mail->Password = "XXXXX";                 //Gmail密碼
    $mail->From = "XXXX@gmail.com";        //寄件者信箱
    $mail->FromName = "XXXX";                  //寄件者姓名
    $mail->Subject ="會議室預約系統-驗證信"; //郵件標題
    $mail->Body = ""; //郵件內容
    $mail->IsHTML(true);                             //郵件內容為html
    $mail->AddAddress('test@gmail.com');            //收件者郵件及名稱
    /*
    if(!$mail->Send()){
        echo "Error: " . $mail->ErrorInfo;
    }else{
        echo "<b>感謝您的留言，您的建議是我們前進的動力。</b>";
    }
    */
?>