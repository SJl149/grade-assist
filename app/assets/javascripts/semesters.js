$(document).on('turbolinks:load', function() {
  $('.datepicker').datepicker({
     autoclose: true,
     daysOfWeekDisabled: [0,5],
     orientation: "auto bottom",
     format: 'yyyy/mm/dd'
   });

  $("#holidays a.add_fields").
  data("association-insertion-position", 'before').
  data("association-insertion-node", 'this');

  $('#holidays').on('cocoon:after-insert',
   function() {
     $(".holiday-fields a.add_fields").
       data("association-insertion-position", 'before').
       data("association-insertion-node", 'this');
     $('.holiday-fields').on('cocoon:after-insert',
        function() {
          $(this).children(".holiday_from_list").remove();
          $(this).children("a.add_fields").hide();
        });
   });

})
