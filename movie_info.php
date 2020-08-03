<?php
	$nav_selected = "MOVIES";
	$left_buttons = "YES";
	$left_selected = "NO";

	include("./nav.php");
	global $db;
?>

<!-- =====================================================================================================

This page displays the information from all 12 tables.
The input is "movie_id". 
This "movie_id" is passed to movie_info.php as a URL parameter.

This pages displays the movie information in three sections.

[A] MOVIE 
[B] PEOPLE
[C] SONGS

The above three sections are outlined below

[A]  MOVIE Details

[A.1] Basic Data  (table: movies)
Display Type: Name - value pairs

id
native_name 
english_name 
year_made 

[A.2] Extended Data (table: movie_data)
Display Type: Name - value pairs

language
country
genre
plot

[A.3] Movie Media (table: movie_media)
Display Type: Show this as a table

m_media_id
m_link  (preferable to display the media on the page)
m_link_type

[A.4] Movie Key Words (table: movie_keywords)
Display Type: Name - value pairs

keywords (show it as a comma separated list) 


[B] PEOPLE Details

[B.1] People  (table: movie_people and people)  
Display Type: Show this as a table

role 
screen_name
first_name
middle_name
last_name 
image_name (prefereable to display the image on the page)

[C] SONGS Details

[C.1] Songs (table: movie_song, songs, song_media, song_people, song_keywords)
Display Type: Show this as a table

title 
lyrics
screen name (from people)
role (from song_people)
keywords (from song_keywords, show this info as comma separated list
media (from songs_media - show the IDs as comma separated list, media_link will be a hyper link)

===================================================================================================== -->

<!-- ========== Getting the movie id =====================================
// This is the movie_id coming to this page as GET parameter
// We will fetch it and save it as $movie_id to be used in our queries
======================================================================== -->
<?php
if (isset($_GET['movie_id'])) {
  $movie_id = mysqli_real_escape_string($db, $_GET['movie_id']);
}
?>


<!-- ================ [A.1] Basic Data (table: movies) ======================
Display Type: Name - value pairs

movie_id
native_name 
english_name 
year_made
========================================================================= -->

<div class="right-content">
  <div class="container">
    <h3 style="color: #01B0F1;">Movies -> Basic Data</h3>

    <?php

    // query string for the Query A.1
    $sql_A1 = "SELECT movie_id, native_name, english_name, year_made 
              FROM movies
              WHERE movie_id =" . $movie_id;

    if (!$sql_A1_result = $db->query($sql_A1)) {
      die('There was an error running query[' . $connection->error . ']');
    }

    if ($sql_A1_result->num_rows > 0) {
      $a1_tuple = $sql_A1_result->fetch_assoc();
      echo '<br> Movie ID : ' . $a1_tuple["movie_id"] .
        '<br> Native Name : ' . $a1_tuple["native_name"] .
        '<br> English Name : ' . $a1_tuple["english_name"] .
        '<br> Year Made :  ' . $a1_tuple["year_made"];
    } //end if
    else {
      echo "0 results";
    } //end else

    $sql_A1_result->close();
    ?>
  </div>
</div>



<!-- ================ [A.2] Extended Data (table: movie_data) ======================
Display Type: Name - value pairs

language
country
genre
plot

TODO: Copy the code snippet from A.1, change the code to reflect Extended data
========================================================================= -->
<div class="right-content">
  <div class="container">
    <h3 style="color: #01B0F1;">Movies -> Extended Data</h3>

    <?php

    $sql_A1 = "SELECT language, country, genre, plot
              FROM movie_data
              WHERE movie_id =" . $movie_id;

    if (!$sql_A1_result = $db->query($sql_A1)) {
      die('There was an error running query[' . $connection->error . ']');
    }

    if ($sql_A1_result->num_rows > 0) {
      $a1_tuple = $sql_A1_result->fetch_assoc();
      echo '<br> Language : ' . $a1_tuple["language"] .
        '<br> Country : ' . $a1_tuple["country"] .
        '<br> Genre : ' . $a1_tuple["genre"] .
        '<br> Plot :  ' . $a1_tuple["plot"];
    } //end if
    else {
      echo "0 results";
    } //end else

    $sql_A1_result->close();
    ?>

  </div>
</div>


<!-- ================ [A.3] Movie Media (table: movie_media) ======================
Display Type: Show this as a table

m_media_id
m_link  (preferable to display the media on the page)
m_link_type
========================================================================= -->

<div class="right-content">
  <div class="container">
    <h3 style="color: #01B0F1;">Movie -> Media</h3>


    <table class="display" id="movie_media_table" style="width:100%">
      <div class="table responsive">

        <thead>
          <tr>
            <th> Movie ID </th>
            <th> Media Id</th>
            <th> Media Link</th>
            <th> Link Type</th>
          </tr>
        </thead>

        <?php

        $sql_A3 = "SELECT movie_id, movie_media_id, m_link, m_link_type 
              FROM movie_media
              WHERE movie_id =" . $movie_id;

        if (!$sql_A3_result = $db->query($sql_A3)) {
          die('There was an error running query[' . $connection->error . ']');
        }

        // this is 1 to many relationship
        // So, many tuples may be returned
        // We will display those in a table in a while loop
        if ($sql_A3_result->num_rows > 0) {
          // output data of each row
          while ($a3_tuple = $sql_A3_result->fetch_assoc()) {
			if($a3_tuple["m_link_type"] == "video")	//Post video
			{
				$vlk = str_replace("watch?v=", "embed/", $a3_tuple["m_link"]); //Convert youtube to embed video
				echo '<tr>
						  <td>' . $a3_tuple["movie_id"] . '</td>
						  <td>' . $a3_tuple["movie_media_id"] . '</td>
						  <td><iframe width="420" height="315" src="'.$vlk.'"></iframe>
						  </td>
						  <td>' . $a3_tuple["m_link_type"] . ' </span> </td>
					  </tr>';
			}
			else if($a3_tuple["m_link_type"] == "poster")	//Post poster
			{
				echo '<tr>
						  <td>' . $a3_tuple["movie_id"] . '</td>
						  <td>' . $a3_tuple["movie_media_id"] . '</td>
						  <td><img style="max-width: 200px; height: auto;" src="images/movies/'.$a3_tuple["m_link"].'""></td>
						  <td>' . $a3_tuple["m_link_type"] . ' </span> </td>
					  </tr>';
			}
          } //end while

        } //end second if 

        $sql_A3_result->close();
        ?>

    </table>
  </div>
</div>





<!-- ================ [A.4] Movie Key Words (table: movie_keywords) ======================
Display Type: Name - value pairs

keywords (show it as a comma separated list) 
========================================================================= -->

<div class="right-content">
  <div class="container">
    <h3 style="color: #01B0F1;">Movie -> Key Words</h3>
      <?php
        $sql_A4 = "SELECT movie_id, keyword
                  FROM movie_keywords
                  WHERE movie_id =" . $movie_id;

        if (!$sql_A4_result = $db->query($sql_A4)) {
          die('There was an error running query[' . $connection->error . ']');
        }
        if ($sql_A4_result->num_rows > 0) {
          while ($a4_tuple = $sql_A4_result->fetch_assoc()) {
            echo '<li>'.$a4_tuple["keyword"].'</li>';
          }
        }
        $sql_A4_result->close();
      ?>
  </div>
</div>




<!-- ================ [B.1] People  (table: movie_people and people)   ======================
Display Type: Show this as a table

role 
screen_name
first_name
middle_name
last_name 
image_name  
========================================================================= -->

<div class="right-content">
  <div class="container">
    <h3 style="color: #01B0F1;">Movie -> People</h3>

      <?php
        $sql_B1 = "SELECT *
                  FROM movie_people JOIN people ON (movie_people.people_id = people.people_id)
                  WHERE movie_people.movie_id =" . $movie_id;

        if (!$sql_B1_result = $db->query($sql_B1)) {
          die('There was an error running query[' . $connection->error . ']');
        }
        if ($sql_B1_result->num_rows > 0) {
          while ($b1_tuple = $sql_B1_result->fetch_assoc()) {
            echo '<li>'.$b1_tuple["role"].': '.$b1_tuple["screen_name"].'</li>';
          }
        }
        $sql_B1_result->close();
      ?>
  </div>
</div>



<!-- ================ [C.1] Songs (table: X-movie_song, X-songs, song_media, X-song_people, song_keywords)   ======================
Display Type: Show this as a table

title 
lyrics
screen name (from people)
role (from song_people)
keywords (from song_keywords, show this info as comma separated list
media (from songs_media - show the IDs as comma separated list, media_link will be a hyper link)
========================================================================= -->
<div class="right-content">
  <div class="container">
    <h3 style="color: #01B0F1;">Movie -> Songs</h3>

    <table class="display" id="movie_media_table" style="width:100%" border="1">
      <div class="table responsive">

      <?php
        $sql_C1 = "SELECT *
                  FROM movie_song JOIN songs ON (movie_song.song_id = songs.song_id)
                  WHERE movie_song.movie_id =" . $movie_id;


        if (!$sql_C1_result = $db->query($sql_C1)) {
          die('There was an error running query[' . $connection->error . ']');
        }
        if ($sql_C1_result->num_rows > 0) {
			echo "<thead>
					  <tr>
						<th> Title </th>
						<th> lyrics</th>
						<th> screen name</th>
						<th> role</th>
						<th> keywords</th>
						<th> media</th>
					  </tr>
				  </thead>";
          while ($c1_tuple = $sql_C1_result->fetch_assoc()) {
          	echo '<tr>';

            echo '<td>' . $c1_tuple["title"] . '</td>
                  <td>' . substr($c1_tuple["lyrics"], 0, 30) . '</td>
                 ';

            // START ====> song stuff
            $song_id = $c1_tuple["song_id"];
            $sql_C2 = "SELECT *
                      FROM song_people JOIN people ON (song_people.people_id = people.people_id)
                      WHERE song_id = ".$song_id;

            if (!$sql_C2_result = $db->query($sql_C2)) {
		          die('There was an error running query[' . $connection->error . ']');
		        }
		        while ($c2_tuple = $sql_C2_result->fetch_assoc()) {
		        	echo '<td>' . $c2_tuple["stage_name"] . '</td>';
		        	echo '<td>' . $c2_tuple["role"] . '</td>';
		        }
		        $sql_C2_result->close();
		        // END ====> song stuff

		        // START ====> song keywords
            $sql_C3 = "SELECT *
                      FROM song_keywords
                      WHERE song_id = ".$song_id;

            if (!$sql_C3_result = $db->query($sql_C3)) {
		          die('There was an error running query[' . $connection->error . ']');
		        }
		        echo '<td>';
		        while ($c3_tuple = $sql_C3_result->fetch_assoc()) {
		          echo '<li>' . $c3_tuple["keyword"] . '</li>';
		        }
		        echo '</td>';
		        $sql_C3_result->close();
		        // END ====> song keywords

		        // START ====> song media
            $sql_C4 = "SELECT *
                      FROM song_media
                      WHERE song_id = ".$song_id;

            if (!$sql_C4_result = $db->query($sql_C4)) {
		          die('There was an error running query[' . $connection->error . ']');
		        }
		        echo '<td>';
		        while ($c4_tuple = $sql_C4_result->fetch_assoc()) {
		        	echo '<li>' . $c4_tuple["s_link"] . '</li>';
		        }
		        echo '</td>';
		        $sql_C4_result->close();
		        // END ====> song media

            echo '</tr>';
          }
        }
        $sql_C1_result->close();
      ?>
  </div>
</div>


<!-- ================== JQuery Data Table script ================================= -->

<script type="text/javascript" language="javascript">
  $(document).ready(function() {

    $('#info').DataTable({
      dom: 'lfrtBip',
      buttons: [
        'copy', 'excel', 'csv', 'pdf'
      ]
    });

    $('#info thead tr').clone(true).appendTo('#info thead');
    $('#info thead tr:eq(1) th').each(function(i) {
      var title = $(this).text();
      $(this).html('<input type="text" placeholder="Search ' + title + '" />');

      $('input', this).on('keyup change', function() {
        if (table.column(i).search() !== this.value) {
          table
            .column(i)
            .search(this.value)
            .draw();
        }
      });
    });

    var table = $('#info').DataTable({
      orderCellsTop: true,
      fixedHeader: true,
      retrieve: true
    });

  });
</script>



<style>
  tfoot {
    display: table-header-group;
  }

</style>

<?php include("./footer.php"); ?>
