$(document).ready(function() {
  $("#question_submit").click(function(){
    var survey_response_id = $("#survey_response_id").val();
    var completed_survey_id = $("#completed_survey_id").val();

    var choice_id = $("input[type='radio'][name='choice_id']:checked").val();


    $.ajax({
      url: "/survey/" + $("#survey_id").val() + "/take",
      type: 'POST',
      data: { 
          survey_response_id: survey_response_id,
          choice_id: choice_id,
          completed_survey_id: completed_survey_id
        },
      success: function(data){
        console.log(data)
         $("#question_container").remove();
         $
        // do something like change the page all question and choices go in question_container div
      },
      error: function(returnValue){

        alert(returnValue.status + ": Something bad happened.");
      }
    });

  });
});


