// Put your application scripts here
$(document).ready(function () {
  $("#feature_no_deadline").on("change", function () {
    if ($(this).is(":checked")) {
      $("#feature_deadline_year").attr("disabled", "disabled");
      $("#feature_deadline_month").attr("disabled", "disabled");
      $("#feature_deadline_day").attr("disabled", "disabled");
    } else {
      $("#feature_deadline_year").removeAttr("disabled");
      $("#feature_deadline_month").removeAttr("disabled");
      $("#feature_deadline_day").removeAttr("disabled");
    }
  }).change();
});

