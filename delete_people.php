<?php
	$nav_selected = "PEOPLE";
	$left_buttons = "NO";
	$left_selected = "NO";

	include("./nav.php");
	global $db;

  if (isset($_GET['people_id'])){
      $people_id = mysqli_real_escape_string($db, $_GET['people_id']);
      $sql = "DELETE FROM songs WHERE people_id = ".$people_id;

      if(!$db->query($sql)) {
        echo "Delete Failed!";
      } else {
        echo "Success!!";
      }
  }
?>