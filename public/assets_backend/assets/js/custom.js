function check_discount(value){
    if(value){
        $('.discount-type').removeClass('hidden');
    } else {
        $('.discount-type').addClass('hidden');
    }
}

$(function () {
    $('#data-table-customer').DataTable({
        'paging': true,
        'lengthChange': true,
        'searching': true,
        'ordering': true,
        'info': true,
        'autoWidth': false,
        'scrollY': "70vh",
        "scrollCollapse": true,
        "scrollX": true,
        "pagingType": "full_numbers",

        //Get data using AJAX
        "serverSide": true,
        "bProcessing": true,
        "ajax": {
            "type": "GET",
            "url": "/quan-tri/danh-sach-san-pham",
            "dataType": "json",
            "contentType": 'application/json; charset=utf-8',
            "data": function (d) {
                d.time_start = $('input#time_start').val();
                d.time_end = $('input#time_end').val();
                // etc
            },
            "complete": function (response) {
                console.log(11111);
                console.log("response data", response);
            },
            "error": function () {
                $("#post_list_processing").css("display", "none");
            }
        },
        "columns": [
            {"data": "id", "orderable": true},
            {"data": "fullname", "orderable": true},
            {"data": "phone", "orderable": true},
            {"data": "email", "orderable": true},
            {"data": "address", "orderable": true}
        ],

        "language": {
            "decimal": ",",
            "emptyTable": "Không có bản ghi nào",
            "info": "Hiển thị _START_ đến _END_ trên tổng số _TOTAL_ bản ghi",
            "infoEmpty": "Không có bản ghi nào",
            "infoFiltered": "(Lọc từ tổng số _MAX_ bản ghi)",
            "infoPostFix": "",
            "thousands": ".",
            "lengthMenu": "Hiển thị _MENU_",
            "loadingRecords": "Đang tải...",
            "processing": "Đang xử lý...",
            "search": "Tìm kiếm:",
            "zeroRecords": "Không tìm thấy kết quả nào",
            "paginate": {
                "first": '<i class="fa fa-fast-backward" aria-hidden="true"></i>',
                "previous": '<i class="fa fa-step-backward" aria-hidden="true"></i>',
                "next": '<i class="fa fa-step-forward" aria-hidden="true"></i>',
                "last": '<i class="fa fa-fast-forward" aria-hidden="true"></i>'
            },
            "aria": {
                "sortAscending": ": kích hoạt sắp xếp tăng dần",
                "sortDescending": ": kích hoạt sắp xếp giảm dần"
            }
        },
    });


    $('#data-table-contract').DataTable({
        'paging': true,
        'lengthChange': true,
        'searching': true,
        'ordering': true,
        'info': true,
        'autoWidth': false,
        'scrollY': "70vh",
        "scrollCollapse": true,
        "scrollX": true,
        "pagingType": "full_numbers",

        //Get data using AJAX
        "serverSide": true,
        "bProcessing": true,
        "ajax": {
            "type": "GET",
            "url": "/contract/getlistcontract",
            "dataType": "json",
            "contentType": 'application/json; charset=utf-8',
            "data": function (d) {
                d.time_start = $('input#time_start').val();
                d.time_end = $('input#time_end').val();
                // etc
            },
            "complete": function (response) {
                console.log("response data", response);
            },
            "error": function () {
                $("#post_list_processing").css("display", "none");
            }
        },
        "columns": [
            {"data": "code", "orderable": true},
            {"data": "customer", "orderable": true},
            {"data": "datecreate", "orderable": true},
            {"data": "package_name", "orderable": true},
            {"data": "price", "orderable": true},
            {"data": "price_discount", "orderable": true},
            {"data": "type_pay", "orderable": true},
            {"data": "status", "orderable": true},
            {"data": "id", "orderable": true}
        ],

        "language": {
            "decimal": ",",
            "emptyTable": "Không có bản ghi nào",
            "info": "Hiển thị _START_ đến _END_ trên tổng số _TOTAL_ bản ghi",
            "infoEmpty": "Không có bản ghi nào",
            "infoFiltered": "(Lọc từ tổng số _MAX_ bản ghi)",
            "infoPostFix": "",
            "thousands": ".",
            "lengthMenu": "Hiển thị _MENU_",
            "loadingRecords": "Đang tải...",
            "processing": "Đang xử lý...",
            "search": "Tìm kiếm theo mã hợp đồng:",
            "zeroRecords": "Không tìm thấy kết quả nào",
            "paginate": {
                "first": '<i class="fa fa-fast-backward" aria-hidden="true"></i>',
                "previous": '<i class="fa fa-step-backward" aria-hidden="true"></i>',
                "next": '<i class="fa fa-step-forward" aria-hidden="true"></i>',
                "last": '<i class="fa fa-fast-forward" aria-hidden="true"></i>'
            },
            "aria": {
                "sortAscending": ": kích hoạt sắp xếp tăng dần",
                "sortDescending": ": kích hoạt sắp xếp giảm dần"
            }
        },
    });

    //==============================================================
    if ($('#barChart_Customer').length > 0) {
        var customerChartData = {
            labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
            datasets: [
                {
                    label: 'Khách hàng',
                    fillColor: 'rgba(60,141,188,0.9)',
                    strokeColor: 'rgba(60,141,188,0.8)',
                    pointColor: '#3b8bba',
                    pointStrokeColor: 'rgba(60,141,188,1)',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(60,141,188,1)',
                    data: [28, 48, 40, 19, 86, 27, 90, 68, 86, 27, 90, 195]
                }
            ]
        };
        //-------------
        //- BAR CHART -
        //-------------
        var barChartCanvas = $('#barChart_Customer').get(0).getContext('2d');
        var barChart = new Chart(barChartCanvas);
        var barChartData = customerChartData;
        barChartData.datasets[0].fillColor = '#00a65a';
        barChartData.datasets[0].strokeColor = '#00a65a';
        barChartData.datasets[0].pointColor = '#00a65a';
        var barChartOptions = {
            //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
            scaleBeginAtZero: true,
            //Boolean - Whether grid lines are shown across the chart
            scaleShowGridLines: true,
            //String - Colour of the grid lines
            scaleGridLineColor: 'rgba(0,0,0,.05)',
            //Number - Width of the grid lines
            scaleGridLineWidth: 1,
            //Boolean - Whether to show horizontal lines (except X axis)
            scaleShowHorizontalLines: true,
            //Boolean - Whether to show vertical lines (except Y axis)
            scaleShowVerticalLines: true,
            //Boolean - If there is a stroke on each bar
            barShowStroke: true,
            //Number - Pixel width of the bar stroke
            barStrokeWidth: 2,
            //Number - Spacing between each of the X value sets
            barValueSpacing: 5,
            //Number - Spacing between data sets within X values
            barDatasetSpacing: 1,
            //String - A legend template
            legendTemplate: '<ul class="<%=name.toLowerCase()%>-legend"><% for (var i=0; i<datasets.length; i++){%><li><span style="background-color:<%=datasets[i].fillColor%>"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>',
            //Boolean - whether to make the chart responsive
            responsive: true,
            maintainAspectRatio: true
        };

        barChartOptions.datasetFill = false;
        barChart.Bar(barChartData, barChartOptions);
    }
    //==============================================================
    //Copy link
    $("#btn_copy_aff").on("click", function () {
        copyToClipboard('#aff_link');
    });

    function copyToClipboard(element) {
        var $temp = $("<input>");
        $("body").append($temp);
        $temp.val($(element).val()).select();
        document.execCommand("copy");
        $temp.remove();
    }


    //==============================================================
});
