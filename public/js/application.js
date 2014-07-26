$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
var $node = "";
var varCount=0;


// var startingNo = 1;

// for(varCount=0;varCount<=startingNo;varCount++){
//     var displayCount = varCount+1;
//     $node += '<p><label for="var'+displayCount+'">Answer '+displayCount+': </label><input type="text" name="var'+displayCount+'" id="var'+displayCount+'"><span class="removeVar">Remove answer</span></p>';
// }
//add them to the DOM


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
$node = '<p><label for="var'+varCount+'">Answer '+varCount+': </label><input type="text" name="var'+varCount+'" id="var'+varCount+' "  value=""><span class="removeVar">Remove answer</span></p>';
$(this).parent().before($node);

  if (varCount >= 2){
    $(".sneaky_submit").css('display', 'inline-block');
  }

});


$(".sneaky_submit").on('click', function(event){
  event.preventDefault();
  var survey_id = $("#survey_id").val();
  var all_answers  = $('[name^="var"]').serializeArray();
  var question = $('[name^="question"]').val();
  var surveyobj = {answer: all_answers, question: question};
  // array_answers.push({question: question})
  // for(var i = 0; i < all_answers.length; i++){

  //   var test ={answer: all_answers[i].value};
  //   array_answers.push(test);

  // }
  //  console.log(array_answers)
  // var answer_to_json = JSON.stringify(array_answers);

    // console.log(answer_to_json)

  $.ajax({
      url: "/survey/" + survey_id + "/questions",
      type: 'POST',
      dataType: "json",
      data: surveyobj,
      success: function(){
        alert('It went well, goddamnit.');
        // go back
        // do something like change the page all question and choices go in question_container div
      },
      error: function(returnValue){

        alert(returnValue.status + ": Something bad happened.");
      }
    });



  // console.log(array_answers);

})







  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
