$(function(){
  $('#signup-form').on('submit', function(e) {
    if ($('#signup-email').val() === '') {
      e.preventDefault();
      $('#email-error').show();
      setTimeout(function() {
        $('#signup-form').find('input[type="submit"]').prop('disabled', false);
      }, 300);
    } else {
      $('#email-error').hide();
    }
  });
})