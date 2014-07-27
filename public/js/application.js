$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
var $node = "";
var varCount=0;


$('form').after($node);
//remove a textfield
$('form').on('click', '.removeVar', function(){
   $(this).parent().remove();
   varCount --;
   if (varCount < 2){
    $(".sneaky_submit").css('display', 'none');
  }

});
//add a new node
$('#addVar').on('click', function(){
varCount++;
$node = '<p class="new_answers"><label for="answer'+varCount+'">Answer '+varCount+': </label><input type="text" name="answer'+varCount+'" id="answer'+varCount+' "  value=""><span class="removeVar">Remove answer</span></p>';
$(this).parent().before($node);

  if (varCount >= 2){
    $(".sneaky_submit").css('display', 'inline-block');
  }

});


$(".sneaky_submit").on('click', function(event){
  event.preventDefault();
  var survey_id = $("#survey_id").val();
  var all_answers  = $('[name^="answer"]').serializeArray();
  var question = $('[name^="question"]').val();
  var surveyobj = {answer: all_answers, question: question};


  $.ajax({
      url: "/survey/" + survey_id + "/questions",
      type: 'POST',
      dataType: "json",
      data: surveyobj,
      success: function(data){
        $(".new_answers").remove();
        $(".question_name").before("<h3> Question: " + data.title+ " <a href='#'> Edit </a> <h3> ");

      },
      error: function(returnValue){

        alert(returnValue.status + ": Something bad happened.");
      }
    });



})







  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
