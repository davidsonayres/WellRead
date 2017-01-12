(function() {
  var canvas = document.querySelector('#highlight');
  var ctx = canvas.getContext('2d');

  var sketch = document.querySelector('#quote_image');
  var sketch_style = getComputedStyle(sketch);
  canvas.width = parseInt(sketch_style.getPropertyValue('width'));
  canvas.height = parseInt(sketch_style.getPropertyValue('height'));

  var mouse = {x: 0, y: 0};

  /* Mouse Capturing Work */
  canvas.addEventListener('mousemove', function(e) {
    mouse.x = e.pageX - this.offsetLeft;
    mouse.y = e.pageY - this.offsetTop;
  }, false);

  /* Drawing */
  ctx.lineWidth = 30;
  ctx.lineJoin = 'round';
  ctx.lineCap = 'round';
  ctx.strokeStyle = 'yellow';

  canvas.addEventListener('mousedown', function(e) {
      ctx.beginPath();
      ctx.moveTo(mouse.x, mouse.y);

      canvas.addEventListener('mousemove', onPaint, false);
  }, false);

  canvas.addEventListener('mouseup', function() {
      canvas.removeEventListener('mousemove', onPaint, false);
  }, false);

  var onPaint = function() {
      ctx.lineTo(mouse.x, mouse.y);
      ctx.stroke();
  };

  /* Saving Drawn Image as DataURL */

  $("#highlight_form").submit(function() {
    var dataURL = canvas.toDataURL();
    $("#quote_highlight").attr("value", dataURL);
  });

}());
