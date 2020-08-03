<?php

  $nav_selected = "SONGS"; 
  $left_buttons = "YES"; 
  $left_selected = "NO"; 

  include("./nav.php");
  global $db;

  ?>


<div class="right-content">
    <div class="container">

      <h3 style = "color: #01B0F1;">Songs -> List of songs</h3>

        <h3><img src="images/cinema_2.png" style="max-height: 35px;" /> Songs</h3>

        <table id="info" cellpadding="0" cellspacing="0" border="0"
            class="datatable table table-striped table-bordered datatable-style table-hover"
            width="100%" style="width: 100px;">
              <thead>
                <tr id="table-first-row">
						<th>ID</th>
                        <th>Title</th>
                        <th>Lyrics</th>
                        <th>Native Name</th>
                        <th>English Name</th>
                        <th>Buttons</th>
                </tr>
              </thead>

              <tfoot>
                <tr>
						<th>ID</th>
                        <th>Title</th>
                        <th>Lyrics</th>
                        <th>Native Name</th>
                        <th>English Name</th>
                        <th>Buttons</th>
                </tr>
              </tfoot>

              <tbody>

              <?php

$sql = "SELECT songs.song_id, `title`, `lyrics`, `native_name`, `english_name` 
		FROM songs 
		LEFT OUTER JOIN movie_song ON (songs.song_id = movie_song.song_id) 
		LEFT OUTER JOIN movies ON (movies.movie_id = movie_song.movie_id);";
$result = $db->query($sql);

                if ($result->num_rows > 0) {
                    // output data of each row
                    while($row = $result->fetch_assoc()) {
                        //$url = "/movie_info.php?id=".$row["movie_id"];
                        echo '<tr>
								<td>'.$row["song_id"].' </span> </td>
                                <td>'.$row["title"].' </span> </td>
                                <td>'.substr($row["lyrics"], 0, 100).'</td>
                                <td>'.$row["native_name"].' </span> </td>
                                <td>'.$row["english_name"].' </span> </td>
								<td><a class="btn btn-info btn-sm">Display</a>
                                    <a class="btn btn-warning btn-sm">Modify</a>
                                    <a onClick="return confirm(\'Are you sure you want to delete?\')" href=\'delete_song.php?song_id='.$row["song_id"].'\'type=\'button\' class=\'btn btn-danger\'>Delete</a>
                            </tr>';
                    }//end while
                }//end if
                else {
                    echo "0 results";
                }//end else

                 $result->close();
                ?>

              </tbody>
        </table>


        <script type="text/javascript" language="javascript">
    $(document).ready( function () {
        
        $('#info').DataTable( {
            dom: 'lfrtBip',
            buttons: [
                'copy', 'excel', 'csv', 'pdf'
            ] }
        );

        $('#info thead tr').clone(true).appendTo( '#info thead' );
        $('#info thead tr:eq(1) th').each( function (i) {
            var title = $(this).text();
            $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
    
            $( 'input', this ).on( 'keyup change', function () {
                if ( table.column(i).search() !== this.value ) {
                    table
                        .column(i)
                        .search( this.value )
                        .draw();
                }
            } );
        } );
    
        var table = $('#info').DataTable( {
            orderCellsTop: true,
            fixedHeader: true,
            retrieve: true
        } );
        
    } );

</script>

        

 <style>
   tfoot {
     display: table-header-group;
   }
 </style>

  <?php include("./footer.php"); ?>
