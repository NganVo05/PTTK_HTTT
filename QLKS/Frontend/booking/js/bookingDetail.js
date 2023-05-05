const toText= {
  "2": "Đảm bảo",
  "1": "Không đảm bảo"
};

const toValue= {
  "Đảm bảo": "2",
  "Không đảm bảo": "1"
};

const toPrice= {
  "Đảm bảo": 1000000,
  "Không đảm bảo": 600000
};

var bookingDetail = JSON.parse(localStorage.getItem('bookingDetail') || '[]');

$(document).ready(function() {
  if (bookingDetail){
    // console.log(toText[bookingDetail.type]);
    bookingDetail.type = toText[bookingDetail.type];
    console.log(bookingDetail);

    $('form input, form select, form textarea').each(function() {
      $(this).val(bookingDetail[this.name]);
      $(this).next().addClass("active");
    });
  }
  
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
  $('button[value="edit"]').click(function() {
    window.location.href = "bookingRoom.html";
  });

  function generateUniqueID(obj) {
    obj.timestamp = new Date().getTime(); // Add timestamp to object
    const props = Object.keys(obj).sort();
    const values = props.map(prop => obj[prop]);
    const hash = CryptoJS.MD5(values.join('|')).toString();
    delete obj.timestamp;
    return hash.substr(0, 12);
  }

  $('button[value="book"]').click(function() {
    var customerID = 'KH' + generateUniqueID(bookingDetail);
    console.log(customerID);
    var reservationID = 'PDK' + generateUniqueID(bookingDetail);
    console.log(reservationID);
    var customerInfor = {};
    customerInfor.MAKH = customerID;
    customerInfor.TENKH = bookingDetail.name;
    customerInfor.CCCD = bookingDetail.CCCD;
    customerInfor.DIACHI = bookingDetail.streetNumber + " " + bookingDetail.street + ", " + bookingDetail.city + ", "  + bookingDetail.country;
    customerInfor.SDT = bookingDetail.phone;
    customerInfor.FAX = bookingDetail.fax;
    customerInfor.EMAIL = bookingDetail.email;
    customerInfor.TENDOAN = bookingDetail.group;
    customerInfor.SOLUONG = bookingDetail.guest;
    console.log("Customer Info: ", JSON.stringify(customerInfor));

    var reservationInfor = {};
    reservationInfor.MAPDK = reservationID;
    reservationInfor.MAKH = customerID;
    reservationInfor.NGAYLAP = new Date();
    reservationInfor.MANV = "NV01"; 
    reservationInfor.NGAYDEN = bookingDetail.arrive;
    reservationInfor.NGAYDI = bookingDetail.depart;
    reservationInfor.SODEMLUUTRU = bookingDetail.day;
    reservationInfor.THANHTIEN = toPrice[bookingDetail.type] * parseInt(bookingDetail.room);
    reservationInfor.TYPE = toValue[bookingDetail.type];
    reservationInfor.SOPHONG = bookingDetail.room;
    reservationInfor.NOTE = bookingDetail.comment;
    console.log("Reservation Info: ", JSON.stringify(reservationInfor));
    
    $.ajax({
      type: "POST",
      url: "http://localhost:5080/api/AddCustomer",
      data: JSON.stringify(customerInfor),
      contentType: "application/json",
      success: function(data) {
        // console.log("Message:", data[0].Message);
        $.ajax({
          type: "POST",
          url: "http://localhost:5080/api/Booking",
          data: JSON.stringify(reservationInfor),
          contentType: "application/json",
          success: function(data) {
            // console.log("Message: ", data[0].Message);
            alert("Message: " + data[0].Message);
            localStorage.removeItem('bookingDetail');
            localStorage.setItem('reservationID', JSON.stringify(reservationID));
            window.location.href = "rating.html";
          },
          error: function(jqXHR, textStatus, errorThrown) {
            console.log("Error:", errorThrown);
          }
        });
      },
      error: function(jqXHR, textStatus, errorThrown) {
        console.log("Error:", errorThrown);
      }
    });

    //   // console.log(JSON.parse(localStorage.getItem('bookingDetail'))); // for debugging purposes
    //   window.location.href = "";
  });
  
});