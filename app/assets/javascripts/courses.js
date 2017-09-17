$(document).on('turbolinks:load', function() {
  $('.course-datepicker').datepicker({
     autoclose: true,
     daysOfWeekDisabled: [0,5],
     orientation: "auto bottom",
     format: 'yyyy/mm/dd'
   });

  $("#students a.add_fields").
  data("association-insertion-position", 'before').
  data("association-insertion-node", 'this');

  $('#students').on('cocoon:after-insert',
   function() {
     $(".enrollment-fields a.add_fields").
       data("association-insertion-position", 'before').
       data("association-insertion-node", 'this');
     $('.enrollment-fields').on('cocoon:after-insert',
        function() {
          $(this).children(".student_from_list").remove();
          $(this).children("a.add_fields").hide();
        });
   });
})
