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
$node = '<p><label for="var'+varCount+'">Answer '+varCount+': </label><input type="text" name="var'+varCount+'" id="var'+varCount+'"><span class="removeVar">Remove answer</span></p>';
$(this).parent().before($node);

  if (varCount >= 2){
    $(".sneaky_submit").css('display', 'inline-block');
  }

});







  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
