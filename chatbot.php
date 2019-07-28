<?php
// --Credit--
// Medium: https://medium.com/@sirateek
// Github: https://github.com/maiyarapkung
// Develop with /\/\ By: Siratee K.
//              \  /
//               \/


  $LINEData = file_get_contents('php://input');
  $jsonData = json_decode($LINEData,true);

  $replyToken = $jsonData["events"][0]["replyToken"];
  $userID = $jsonData["events"][0]["source"]["userId"];
  $text = $jsonData["events"][0]["message"]["text"];
  $timestamp = $jsonData["events"][0]["timestamp"];

  $servername = "localhost";
  $username = "root";
  $password = "";
  $dbname = "LINE";
  $mysql = new mysqli($servername, $username, $password, $dbname);
  mysqli_set_charset($mysql, "utf8");

  if ($mysql->connect_error){
  $errorcode = $mysql->connect_error;
  print("MySQL(Connection)> ".$errorcode);
  }

  function sendMessage($replyJson, $sendInfo){
          $ch = curl_init($sendInfo["URL"]);
          curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
          curl_setopt($ch, CURLINFO_HEADER_OUT, true);
          curl_setopt($ch, CURLOPT_POST, true);
          curl_setopt($ch, CURLOPT_HTTPHEADER, array(
              'Content-Type: application/json',
              'Authorization: Bearer ' . $sendInfo["AccessToken"])
              );
          curl_setopt($ch, CURLOPT_POSTFIELDS, $replyJson);
          $result = curl_exec($ch);
          curl_close($ch);
    return $result;
  }

  $mysql->query("INSERT INTO `LOG`(`UserID`, `Text`, `Timestamp`) VALUES ('$userID','$text','$timestamp')");

  $getUser = $mysql->query("SELECT * FROM `Customer` WHERE `UserID`='$userID'");
  $getuserNum = $getUser->num_rows;
  $replyText["type"] = "text";
  if ($getuserNum == "0"){
    $replyText["text"] = "สวัสดีคับบบบ";
  } else {
    while($row = $getUser->fetch_assoc()){
      $Name = $row['Name'];
      $Surname = $row['Surname'];
      $CustomerID = $row['CustomerID'];
    }
    $replyText["text"] = "สวัสดีคุณ $Name $Surname (#$CustomerID)";
  }

  $lineData['URL'] = "https://api.line.me/v2/bot/message/reply";
  $lineData['AccessToken'] = "(ใส่ Channel AccessToken ของคุณตรงนี้)";

  $replyJson["replyToken"] = $replyToken;
  $replyJson["messages"][0] = $replyText;

  $encodeJson = json_encode($replyJson);

  $results = sendMessage($encodeJson,$lineData);
  echo $results;
  http_response_code(200);

// --Credit--
// Medium: https://medium.com/@sirateek
// Github: https://github.com/maiyarapkung
// Develop with /\/\ By: Siratee K.
//              \  /
//               \/
