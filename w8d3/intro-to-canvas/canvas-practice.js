// Bangladesh flag!

document.addEventListener("DOMContentLoaded", function() {
    const canvasEle = document.getElementById("myCanvas")
    canvasEle.width = 800;
    canvasEle.height = 500;

    const ctx = canvasEle.getContext("2d");
    ctx.fillStyle = "rgb(0, 106, 78)";
    ctx.fillRect(0, 0, 800, 500);

    ctx.beginPath();
    ctx.arc(350, 250, 160, 0, 2*Math.PI, true);
    ctx.strokeStyle = "rgb(244, 42, 65)";
    ctx.lineWidth = 10;
    ctx.stroke();
    ctx.fillStyle = "rgb(244, 42, 65)";
    ctx.fill();
});