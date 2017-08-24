$(document).on('turbolinks:load', function() {
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
