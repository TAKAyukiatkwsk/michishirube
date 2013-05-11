$(document).ready(function() {
  var $task = $(".task");
  var $task_status_block = $(".task_status_block");
  $.event.props.push("dataTransfer");

  $task.on("dragstart", function(event) {
    $(this).css("opacity", "0.4");
    event.dataTransfer.effectAllowed = "move";
    event.dataTransfer.setData("text/html", $(this).html());
  });
  $task_status_block.on("dragover", function(event) {
    if (event.preventDefault) {
      event.preventDefault();
    }
    event.dataTransfer.dropEffect = "move";
  });
  $task_status_block.on("dragend", function (event) {
    $(this).css("opacity", "1");
  });
  $task_status_block.on("drop", function(event) {
    event.stopPropagation();
    $(this).html(event.dataTransfer.getData("text/html"));
    return false;
  });
});
