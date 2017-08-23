$(document).on('turbolinks:load', function() {
  $('.datepicker').datepicker({
    autoclose: true,
    daysOfWeekDisabled: [0,5,6],
    format: 'yyyy/mm/dd'
  });

   $("#holidays a.add_fields").
   data("association-insertion-position", 'after').
   data("association-insertion-node", 'this');

  $('#holidays').on('cocoon:after-insert',
   function() {
     $(".holiday-fields a.add_fields").
       data("association-insertion-position", 'after').
       data("association-insertion-node", 'this');
     $('.datepicker').datepicker({
       autoclose: true,
       daysOfWeekDisabled: [0,5,6],
       format: 'yyyy/mm/dd'
     });
   });
})
