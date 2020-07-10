<?php

  $nav_selected = "MOVIES"; 
  $left_buttons = "YES"; 
  $left_selected = "Data"; 

  include("./nav.php");
  global $db;

  ?>


<div class="right-content">
    <div class="container">

      <h3 style = "color: #01B0F1;">Movies -> Movie List with extended data</h3>

        <h3><img src="images/cinema_2.png" style="max-height: 35px;" /> Movies</h3>

        <table id="info" cellpadding="0" cellspacing="0" border="0"
            class="datatable table table-striped table-bordered datatable-style table-hover"
            width="100%" style="width: 100px;">
              <thead>
                <tr id="table-first-row">
                        <th>Movie ID</th>
                        <th>Native Name</th>
                        <th>English Name</th>
  			<th>Release Year</th>
                        <th>Language</th>
                        <th>Country</th>
			<th>Genre</th>
                        <th>Plot</th>

                </tr>
              </thead>

              <tbody>

              <?php

$sql = "SELECT * FROM movies LEFT OUTER JOIN movie_data ON movies.movie_id = movie_data.movie_id ORDER BY year_made ASC;";


$result = $db->query($sql);

                if ($result->num_rows > 0) {
                    // output data of each row
                    while($row = $result->fetch_assoc()) {
                        //$url = "/movie_info.php?id=".$row["movie_id"];
                        echo '<tr>
				<td>'.$row["movie_id"].'</td>
				<td>'.$row["native_name"].'</td>
				<td>'.$row["english_name"].'</td>
				<td>'.$row["year_made"].'</td>
				<td>'.$row["language"].'</td>
				<td>'.$row["country"].'</td>
				<td>'.$row["genre"].'</td>
				<td>'.substr($row["plot"],0,30).'</td>
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
    
        var table = $('').DataTable( {
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
