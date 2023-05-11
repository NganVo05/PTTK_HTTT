let staffUrl = "http://localhost:5080/api/staff/";

const toText= {
  "2": "Đảm bảo",
  "1": "Không đảm bảo",
  "MAPHONG": "Mã phòng",
  "MOTA": "Mô tả",
  "LOAIPHONG": "Loại phòng",
  "GIA": "Giá"
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
  console.log("Billdetail: ", billDetail);
  $.ajax({
    type: "GET",
    url: staffUrl + "detailBill/" + billDetail.MAPDK,
    // data: JSON.stringify(reservationInfor),
    contentType: "application/json",
    success: function(data) {
      data[0].TINHTRANG = billDetail.TINHTRANG;
      data[0].PTTT = billDetail.PTTT;
      console.log("Data: ", data[0]);

      $.each(data, function(name, cell) {
        // console.log(cell.NGAYDI);
        cell.NGAYLAP = cell.NGAYLAP.substring(0, 10);
        cell.NGAYDEN = cell.NGAYDEN.substring(0, 10);
        cell.NGAYDI = cell.NGAYDI.substring(0, 10);
        cell.LOAIPHONG = toText[cell.LOAIPHONG];
      });
      
      $.each(data[0], function(name, value) {
        $('input[name=' + name + ']').val(value);
        // console.log(name);
        // console.log(value);
        $('input[name=' + name + ']').next().addClass("active");

      });
      // alert("Message: " + data[0].Message);
      // localStorage.removeItem('bookingDetail');
      // localStorage.setItem('reservationID', JSON.stringify(reservationID));
      // window.location.href = "rating.html";
    },
    error: function(jqXHR, textStatus, errorThrown) {
      console.log("Error:", errorThrown);
    }
  });
   
});
  

$(document).ready(function() {
  $('button[value="edit"]').click(function() {
    $('#PTTT').prop('readonly', false);
    $('#NOTE').prop('readonly', false);
    $('#TINHTRANG').prop('readonly', false);
    $('#TINHTRANG').prop('required', true);
    $('button[value="commit"]').prop("disabled", false);
  });

  $('button[value="commit"]').click(function() {
    var billChange = {};
    billChange.MAPDK = billDetail.MAPDK;
    billChange.PTTT = $('#PTTT').val();
    billChange.TINHTRANG = $('#TINHTRANG').val();
    billChange.NOTE = $('#NOTE').val();
    billChange.NGAYLAP = new Date();

    console.log('Bill change: ', billChange);

    $.ajax({
      type: "POST",
      url: staffUrl + "updateBill",
      data: JSON.stringify(billChange),
      contentType: "application/json",
      success: function(data) {
        // alert(data);
        alert(data[0].RESULT);
  
      },
      error: function(jqXHR, textStatus, errorThrown) {
        console.log("Error:", errorThrown);
      }
    });

    $('#PTTT').prop('readonly', true);
    $('#NOTE').prop('readonly', true);
    $('#TINHTRANG').prop('readonly', true);
    $('#TINHTRANG').prop('required', false);
    $('button[value="commit"]').prop("disabled", true);
    window.location.href = "/checkout/HoaDon.html";
  });
  
});