(function() {
  var canvas = document.querySelector('#highlight');
  var ctx = canvas.getContext('2d');

  var sketch = document.querySelector('#quote_image');
  var sketch_style = getComputedStyle(sketch);
  canvas.width = parseInt(sketch_style.getPropertyValue('width'));
  canvas.height = parseInt(sketch_style.getPropertyValue('height'));

  var mouse = {x: 0, y: 0};
  var touch = {x: 0, y: 0};

  var touchX, touchY;

  /* Mouse Capturing Work */
  canvas.addEventListener('mousemove', function(e) {
    // mouse.x = e.pageX - this.offsetLeft;
    // mouse.y = e.pageY - this.offsetTop;
    mouse.x = e.layerX - this.offsetLeft;
    mouse.y = e.layerY - this.offsetTop;
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

  function drawLine(ctx,x,y,size) {

    // If lastX is not set, set lastX and lastY to the current position
    if (lastX ==-1) {
        lastX = x;
        lastY = y;
    }

    // Select a fill style
    ctx.strokeStyle = "yellow";
    ctx.lineCap = "round";
    ctx.lineJoin = 'round';

    // Draw a filled line
    ctx.beginPath();

    // First, move to the old (previous) position
    ctx.moveTo(lastX,lastY);

    // Now draw a line to the current touch/pointer position
    ctx.lineTo(x,y);

    // Set the line thickness and draw the line
    ctx.lineWidth = 30;
    ctx.stroke();

    ctx.closePath();

    // Update the last position to reference the current position
    var lastX = x;
    var lastY = y;
  }

  function highlight_touchStart(e) {
    // Update the touch co-ordinates
    getTouchPos(e);

    drawLine(ctx,touchX,touchY,6);

    // Prevents an additional mousedown event being triggered
    event.preventDefault();
  }

  // Draw something and prevent the default scrolling when touch movement is detected
  function highlight_touchMove(e) {
    // Update the touch co-ordinates
    getTouchPos(e);

    // During a touchmove event, unlike a mousemove event, we don't need to check if the touch is engaged, since there will always be contact with the screen by definition.
    drawLine(ctx,touchX,touchY,6);

    // Prevent a scrolling action as a result of this touchmove triggering.
    event.preventDefault();
  }

  // Get the touch position relative to the top-left of the canvas
  // When we get the raw values of pageX and pageY below, they take into account the scrolling on the page
  // but not the position relative to our target div. We'll adjust them using "target.offsetLeft" and
  // "target.offsetTop" to get the correct values in relation to the top left of the canvas.
  function getTouchPos(e) {
    if (!e)
      var e = event;

    if(e.touches) {
      if (e.touches.length == 1) { // Only deal with one finger

      var touch = e.touches[0]; // Get the information for finger #1

      touchX = touch.clientX - touch.target.getBoundingClientRect().left;
      touchY = touch.clientY - touch.target.getBoundingClientRect().top;
      }
    }
  }

  /* Saving Drawn Image as DataURL */

  $("#highlight_form").submit(function() {
    var dataURL = canvas.toDataURL();
    $("#quote_highlight").attr("value", dataURL);
  });

  // React to touch events on the canvas
  canvas.addEventListener('touchstart', highlight_touchStart, false);
  canvas.addEventListener('touchmove', highlight_touchMove, false);


}());
