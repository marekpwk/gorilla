$(document).ready(function() {
  $("#question_submit").click(function(){
    var survey_response_id = $("#survey_response_id").val();
    var completed_survey_id = $("#completed_survey_id").val();

    var choice_id = $("input[type='radio'][name='choice_id']:checked").val();

    if (choice_id === undefined) {
      // show an error message
      alert("Please select one of the choices.");
    }
    else {

      $.ajax({
        url: "/survey/" + $("#survey_id").val() + "/take",
        type: 'POST',
        dataType: "json",
        data: { 
            survey_response_id: survey_response_id,
            choice_id: choice_id,
            completed_survey_id: completed_survey_id
          },
        success: function(data){
          console.log(data)
           $("#question_container").html("");

           if ( data.title != undefined) {
             $("#question_container").append(data.title);
             $("#question_container").append('<input type="hidden" id="question_id" name="question_id" value="' + data.question_next_id + '">');

              for data.choices.each {
                
              }
           }
           else {
            $("#question_container").append("<h1>Thanks for taking our survey!</h1>");
           }

           // $("#question_submit").css("display", "none")
           // $(".survey_content").append("<h4>" + data.title + "</h4>")
           // $(".survey_content").append("<p>" + data.option + "</p>")
          // do something like change the page all question and choices go in question_container div
        },
        error: function(returnValue){

          alert(returnValue.status + ": Something bad happened.");
        }
      });
    }

  });
});


