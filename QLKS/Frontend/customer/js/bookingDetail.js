const toText= {
  "guaranteed-reservation": "Đảm bảo",
  "non-guaranteed-reservation": "Không đảm bảo"
};

var bookingDetail = JSON.parse(localStorage.getItem('bookingDetail') || '[]');

$(document).ready(function() {
  var arriveInput = $("#arrive");
  var departInput = $("#depart");
  var dayLabel = $("#day");
  
  // Set the minimum value of the date inputs to today's date
  var currentDate = new Date().toISOString().slice(0, 10);
  arriveInput.attr("min", currentDate);
  // Set min value of depart to arrive date
  $("#depart").attr("min", $("#arrive").val());

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
    var maxValue = 10; // set the maximum value
    var select = $('#number-of-rooms'); // select the select element
    
    // loop through the values and append new options
    for (var i = 1; i <= maxValue; i++) {
      select.append('<option value="' + i + '">' + i + '</option>');
    }
  });

$(document).ready(function() {
  $('button[value="edit"]').click(function() {
    window.location.href = "bookingRoom.html";
  });
});

$(document).ready(function() {
  $('button[value="book"]').click(function() {
      var formValues = {};
      $('form input, form select, form textarea').each(function() {
        // if ($(this).val() === '' && this.name !== 'group' && this.name !== 'comment') {
        //     alert('Please fill out field ' + this.name + ' before submitting the form.');
        //     return false; // exit the loop if a field is empty
        // }
        formValues[this.name] = $(this).val();
      });
      console.log(formValues);
    });
});
