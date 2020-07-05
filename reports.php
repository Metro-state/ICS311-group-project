  
<?php

  $nav_selected = "MOVIES"; 
  $left_buttons = "NO"; 
  $left_selected = ""; 

  include("./nav.php");
  global $db;

  ?>


<div class="right-content">
    <div class="container">

      <h2 style = "color: #01B0F1;">REPORT SUMMARY</h2>

        <table id="info" cellpadding="0" cellspacing="0" border="0"
            class="datatable table table-striped table-bordered datatable-style table-hover"
            width="100%" style="width: 200px;">
              <thead>
                <tr id="table-first-row">
                        <th>Year Made</th>
                        <th>Movie Count</th>
                      
                </tr>
              </thead>

            

              <tbody>

              <?php

$sql = "SELECT year_made, COUNT(native_name) AS movie_count FROM movies GROUP BY year_made DESC;";

$result = $db->query($sql);

                if ($result->num_rows > 0) {
                    // output data of each row
                    while($row = $result->fetch_assoc()) {
                        echo '<tr>
                                <td>'.$row["year_made"].'</td>
                                <td>'.$row["movie_count"].' </span> </td>
                              
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