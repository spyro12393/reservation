<?php
	require_once "defaultincludes.inc";
	require_once "phpmailer/class.phpmailerinc.php";

	if(isset($_GET['para'])){
		$email=base64_decode($_GET['para']);
 		$db=mysqli_connect($db_host,$db_login,$db_password,$db_database,$db_port);
 		if(!$db){
 			die("連接失敗" .mysqli_connect_error());
 		}
 		$sql="select a.accountstatus accountstatus, b.timesstamp timesstamp from mrbs_users a join mrbs_users_valid b ON a.email=b.email where a.email='$email'" or die(myslqi_error());
        $result=mysqli_query($db,$sql);
        if(mysqli_num_rows($result)>0){
        	$row=mysqli_fetch_assoc($result);
        	if($row['accountstatus']==0){
                $time=strtotime($row['timesstamp']);
                $now=time();
                $timestamp = date("Y-m-d H:i:s");
        		if($now-$time>300){  //五分鐘內有效
                    $sql="DELETE FROM mrbs_users_valid WHERE email='$email'" or die(mysqli_error());
                    mysqli_query($db, $sql);
                    //
                    $sql="INSERT INTO mrbs_users_valid (email, timesstamp)
                              VALUES('$email', '$timestamp')" or die(mysqli_error());
                    mysqli_query($db, $sql);
                    echo "連結已失效，請重新整理或到信箱收取驗證信重新啟用帳號";//連結失效的情況下
        			/*if(!$mail->Send()){
        				echo "Error: " . $mail->ErrorInfo;
    				}
    				else{
                        $sql="INSERT INTO mrbs_users_valid (email, timesstamp)
                        VALUES('$email', '$timestamp')" or die(mysqli_error());
                        mysqli_query($db, $sql);
        				echo "連結已失效，請重新整理或到信箱收取驗證信重新啟用帳號";//連結失效的情況下
    				}*/
        		}
        		elseif($now-$time<=300){
        			$sql="update mrbs_users set accountstatus = '1' where email = '$email'" or die(myslqi_error());
        			mysqli_query($db, $sql);
                    $sql="DELETE FROM mrbs_users_valid WHERE email='$email'" or die(mysqli_error());
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

