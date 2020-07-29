<?php
	$nav_selected = "SONGS";
	$left_buttons = "NO";
	$left_selected = "NO";

	include("./nav.php");
	global $db;

  if (isset($_GET['song_id'])){
      $song_id = mysqli_real_escape_string($db, $_GET['song_id']);
      $sql = "DELETE FROM songs WHERE song_id = ".$song_id;

      if(!$db->query($sql)) {
        echo "Delete Failed!";
      } else {
        echo "Success!!";
      }
  }
?>