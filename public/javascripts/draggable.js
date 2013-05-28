$(document).ready(function() {
  var $task = $(".task");
  var $task_status_block = $(".task_status_block");
  var $dragged_task = null;
  $.event.props.push("dataTransfer");

  $task.on("dragstart", function(event) {
    $(this).css("opacity", "0.4");
    $dragged_task = $(this);
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
    // ドラッグ元の要素を削除する
    $dragged_task.remove();
  });
  $task_status_block.on("drop", function(event) {
    event.stopPropagation();
    // 操作しやすいようにjQueryオブジェクトにしておく
    var $append_task = $('<div class="task"></div>');
    $append_task.attr({"id": $dragged_task.attr("id"), "draggable": true});
    $append_task.html(event.dataTransfer.getData("text/html"));
    $(this).append($append_task);
    return false;
  });
});
