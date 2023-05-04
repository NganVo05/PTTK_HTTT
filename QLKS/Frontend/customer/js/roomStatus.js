const toText= {
  "1": "Đảm bảo",
  "2": "Không đảm bảo",
  "MAPHONG": "Mã phòng",
  "MOTA": "Mô tả",
  "LOAIPHONG": "Loại phòng",
  "GIA": "Giá"
};

$(document).ready(function() {
  var arriveInput = $("#arrive");
  var departInput = $("#depart");
  var dayLabel = $("#day");
  // Set the minimum value of the date inputs to today's date
  var currentDate = new Date().toISOString().slice(0, 10);
  // console.log(currentDate); 
  
  arriveInput.attr("min", currentDate);
  // Set min value of depart to arrive date
  var arriveValue = $("#arrive").val();
  // console.log(arriveValue);
  if(!arriveValue)
    arriveValue = currentDate;
  $("#depart").attr("min", arriveValue);

  // Update min value of depart when arrive date changes
  $("#arrive").change(function() {
      $("#depart").attr("min", $(this).val());
  });
  
  // Add event listeners to the date inputs
  arriveInput.on("input", updateDayLabel);
  departInput.on("input", updateDayLabel);
  
  // Function to update the day label based on the arrive and depart dates
  function updateDayLabel() {
    var arriveDate = Date.parse(arriveInput.val());
    var departDate = Date.parse(departInput.val());
    if (!isNaN(arriveDate) && !isNaN(departDate)) {
      var dayDiff = Math.ceil((departDate - arriveDate) / (1000 * 60 * 60 * 24)) + 1;
      dayLabel.next().addClass("active");
      dayLabel.val(dayDiff);
    }
  }
});
  
$(document).ready(function() {
  function floatLabel(inputType) {
      $(inputType).each(function() {
          var $this = $(this);
          $this.focus(function() {
              $this.next().addClass("active");
          });
          $this.blur(function() {
              if ($this.val() === '' || $this.val() === 'blank') {
                  $this.next().removeClass();
              }
          });
      });
  }
  floatLabel(".floatLabel");
});

$(document).ready(function() {
    $('button[value="booking"]').click(function() {
      window.location.href = "bookingRoom.html";
    });
  });

$(document).ready(function() {
  function createTable(data) {
    var table = $("<table></table>").addClass("table table-striped table-bordered");
    var headers = Object.keys(data[0]);
    
    $.each(data, function(index, cell){
      cell.LOAIPHONG = toText[cell.LOAIPHONG]; 
    });

    var headerRow = $("<tr></tr>").addClass("thead-dark");
    headers.forEach(function(header) {
      headerRow.append($("<th></th>").text(toText[header]));
    });
    table.append(headerRow);
  
    data.forEach(function(rowData, index) {
      var row = $("<tr></tr>");
      row.append($("<td></td>").text(index + 1)); // add 'No.' value to the row
      headers.slice(1).forEach(function(header) {
        row.append($("<td></td>").text(rowData[header]));
      });
      table.append(row);
    });  
    // Replace existing table with new table (if it exists)
    $("#myTable table").replaceWith(table);
    return table;
  }
  
  $('form').submit(function(event) {
    event.preventDefault();
    var formValues = {};
    $('form input, form select, form textarea').each(function() {
      formValues[this.name] = $(this).val();
    });
    // console.log(formValues);
    var info = {};
    info.arrive = formValues.arrive;
    info.depart = formValues.depart;
    info.type = formValues.type;

    $.ajax({
      type: "POST",
      url: "http://localhost:5080/api/RoomStatus",
      data: JSON.stringify(info),
      contentType: "application/json",
      success: function(data) {
        // console.log("Data received:", data[0]);
        var myTable = createTable(data[0]);
        // Select the form element by its ID and append the table to it
        $("#myTable").append(myTable);
      },
      error: function(jqXHR, textStatus, errorThrown) {
        console.log("Error:", errorThrown);
      }
    });
  });
});