
$(document).ready(function() {
$('#user_page').change(function(event){
  var input = $(this).val()
  var progressbar = $('#progressbar'),
  max = progressbar.attr('max'),
  value = 0,
  time = (1000/max)*15;

  var loading = function() {
 value += 10;
  addValue = progressbar.val(value);

  $('.progress-value').html(value + '%');

 if (value >= input) {
    clearInterval(animate);
}
};

var animate = setInterval(function() {
    loading();
}, time);
});
});
