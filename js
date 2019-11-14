$(document).ready(function () {
    var apiBaseUrl = "http://localhost:52606/";
    $('#btnGetData').click(function () {
        //  $('#table1').DataTable();
        $.ajax({
            url: apiBaseUrl + "api/RawMaterialOrder",
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                //var $table = document.getElementById('#table1');
                var $table = $('<table />').addClass('dataTable table table-bordered table-striped');
                var $header = $('<thead />').html('<tr><th>RawMaterialOrder ID</th><th>SupplierName</th><th> RawMaterialTotalQuantity</th><th>RawMaterialTotalPrice</th></tr>');
                $table.attr('id', 'table1');
                $table.append($header);
                var $tbody = $('<tbody>');
                $table.append($tbody);
                var j = 1;
                $.each(data, function (i, val) {
                    var $row = $('<tr />');
                    $row.append($('<td />').html(val.RawMaterialOrderID));
                    $row.append($('<td />').html(val.SupplierName));
                    $row.append($('<td />').html(val.RawMaterialTotalQuantity));
                    $row.append($('<td />').html(val.RawMaterialTotalPrice));
                    

                    $row.append($('<button id="GetDetails" onclick="details(this)">Details</button>'));



                    // $row.append($('<td />').html('' ));
                    //$row.append($('<td />').html(val.CreationDateTime));
                    //$row.append($('<td />').html(val.LastUpdateDateTime));
                    $tbody.append($row);

                }

                );

                $('#updatePanel').html($table);
                $('#table1').DataTable();
            },
            error: function () {
                alert('Error!');
            }
        });
    });
});
