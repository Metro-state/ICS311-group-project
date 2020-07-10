<?php
	$nav_selected = "MOVIES";
	$left_buttons = "NO";
	$left_selected = "NO";

	include("./nav.php");
	global $db;

  if (isset($_GET['movie_id'])){
      $movie_id = mysqli_real_escape_string($db, $_GET['movie_id']);
      $sql = "DELETE FROM movies WHERE movie_id = ".$movie_id;

      if(!$db->query($sql)) {
        echo "Delete Failed!";
      } else {
        echo "Success!!";
      }
  }
?>

