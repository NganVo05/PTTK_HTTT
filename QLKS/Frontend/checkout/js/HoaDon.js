let staffUrl = "http://localhost:5080/api/staff/";

const toText= {
    "2": "Đảm bảo",
    "1": "Không đảm bảo",
    "MAPHONG": "Mã phòng",
    "MOTA": "Mô tả",
    "LOAIPHONG": "Loại phòng",
    "GIA": "Giá",
    "MAPDK": "Mã PĐK",
    "MANV": "Mã nhân viên",
    "MAKH": "Mã khách hàng",
    "MAHD": "Mã hóa đơn",
    "NGAY_LAP": "Ngày lập",
    "PTTT": "PTTT",
    "NOTE": "Yêu cầu",
    "THANHTIEN": "Thành tiền",
    "TINHTRANG": "Tình trạng"
  };

$(document).ready(function() {
    function createTable(data) {
        var table = $("<table></table>").addClass("table table-striped table-bordered");
        
        // bỏ cột note ra
        var headers = Object.keys(data[0]).filter(function(header) {
            return header !== "NOTE";
          });
        
        $.each(data, function(index, cell){
            var date = new Date(cell.NGAY_LAP);
            var options = { timeZone: 'Asia/Ho_Chi_Minh' };
            var formattedDate = date.toLocaleString('vi-VN', options);
            cell.NGAY_LAP = formattedDate; 
        });
        
        $.each(data, function(index, cell){
            var price = cell.THANHTIEN;
            var roundedPrice = Math.round(price);
            cell.THANHTIEN = roundedPrice; 
        });

        var headerRow = $("<tr></tr>").addClass("thead-dark");
        headers.forEach(function(header) {
          headerRow.append($("<th></th>").text(toText[header]));
        });
        headerRow.append($("<th></th>").text("Edit")); // add Edit header
        table.append(headerRow);
      
        data.forEach(function(rowData, index) {
          var row = $("<tr></tr>");
          row.append($("<td></td>").text(index + 1)); // add 'No.' value to the row
          headers.slice(1).forEach(function(header) {
            row.append($("<td></td>").text(rowData[header]));
          });
          row.append($("<td></td>").append($("<button></button>")
                                    .addClass("btn btn-sm btn btn-info")
                                    .text("Edit")
                                    .click(function(){
                                        var billDetail = {};
                                        billDetail.MAHD = rowData.MAHD;
                                        billDetail.MANV = rowData.MANV;
                                        billDetail.MAPDK = rowData.MAPDK;
                                        console.log("Bill detail: ",billDetail);
                                        localStorage.removeItem('billDetail');
                                        localStorage.setItem('billDetail', JSON.stringify(billDetail));
                                        window.location.href = "/checkout/billDetail.html";
                                    }))); // add Edit button
          table.append(row);
        });  
        return table;
      }

      $.ajax({
        type: "GET",
        url: staffUrl + "HoaDon",
        // data: JSON.stringify(info),
        contentType: "application/json",
        dataType: "json",
        success: function(data) {
            // console.log("ERROR:", data[0][0].ERROR);
            console.log("DATA:", data);
            // console.log("Date: ", new Date());
            
          if (data[0] === undefined){
            var lable1 = $("<lable></lable>");
            lable1.text('No available rooms were ready for the selected dates.');
            // Replace existing table with new table (if it exists)
            $("#myTable").empty();
            $("#myTable").append(lable1);
          }
          else if ((typeof JSON.stringify(data[0].ERROR) !== 'undefined') === false){
            var myTable = createTable(data);
            // Replace existing table with new table (if it exists)
            $("#myTable").empty();
            // Select the form element by its ID and append the table to it
            $("#myTable").append(myTable);
          }
          else{
            console.log("ERROR:", data[0][0].ERROR);
            var lable2 = $("<lable></lable>");
            lable2.text(data[0].ERROR);
            // Replace existing table with new table (if it exists)
            $("#myTable").empty();
            $("#myTable").append(lable2);
          }
        },
        error: function(jqXHR, textStatus, errorThrown) {
          console.log("Error:", errorThrown);
        }
      });
});


