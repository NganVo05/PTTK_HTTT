let staffUrl = "http://localhost:5080/api/staff/";

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

var billDetail = JSON.parse(localStorage.getItem('billDetail') || '[]');

$(document).ready(function() {
  console.log("MAPDK: ", billDetail.MAPDK);
  $.ajax({
    type: "GET",
    url: staffUrl + "HoaDon/" + billDetail.MAPDK,
    // data: JSON.stringify(reservationInfor),
    contentType: "application/json",
    success: function(data) {
      console.log("Message: ", data);
      // alert("Message: " + data[0].Message);
      // localStorage.removeItem('bookingDetail');
      // localStorage.setItem('reservationID', JSON.stringify(reservationID));
      // window.location.href = "rating.html";
    },
    error: function(jqXHR, textStatus, errorThrown) {
      console.log("Error:", errorThrown);
    }
  });
  // $('form input, form select, form textarea').each(function() {
  //   $(this).val(data[this.name]);
  //   $(this).next().addClass("active");
  // });  
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
  
});