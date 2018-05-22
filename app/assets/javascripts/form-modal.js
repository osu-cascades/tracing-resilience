$(document).on('turbolinks:load', function() {
  $('#accept-terms-of-service').on('click', function() {
    $('#terms-of-service-checkbox').prop("checked", true);
  });
});