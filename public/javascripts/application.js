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

  $("button#show_feature_form").on("click", function () {
    $("form#feature").show();
  });

  $("form#feature").submit(function () {
    $('div#errors').empty();
    $.ajax({
      type: 'POST',
      url: $(this).attr('action'),
      data: $(this).serialize(),
      success: function (data) {
        alert('success');
        // update feature data
        $('h1').text(data.feature.name);
        var deadline = '';
        if (data.feature.deadline === null) {
          deadline = 'なし';
        } else {
          deadline = data.feature.deadline_year + '-' +
                     data.feature.deadline_month + '-' +
                     data.feature.deadline_day;
        }
        $('#deadline').text(deadline);
        $("form#feature").hide();
      },
      error: function (xhr, textStatus, errorThrown) {
        errors = JSON.parse(xhr.responseText);
        for (var i in errors) {
          for (var j in errors[i]) {
            $('div#errors').append('<p>' + errors[i][j] + '</p>');
          }
        }
      }
    });
    return false;
  });
});

