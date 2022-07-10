document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("mycanvas");
  canvas.width = 500;
  canvas.height = 500;
  const ctx = canvas.getContext("2d");

  ctx.fillStyle = "black";
  ctx.fillRect(0, 0, 250, 250);

  ctx.beginPath();
  ctx.arc(120, 120, 100, 0, 2 * Math.PI);
  ctx.strokeStyle = "white";
  ctx.lineWidth = 10;
  ctx.stroke();
});
