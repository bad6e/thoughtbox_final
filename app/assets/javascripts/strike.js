$(document).ready(function(){
  strikeThrough();
  removeStrikeThrough();
});

function strikeThrough(){
  $('.read').on('click', function(){
    $(this).parent().css("text-decoration", "line-through");
  });
}

function removeStrikeThrough(){
  $('.unread').on('click', function(){
    $(this).parent().css("text-decoration", "none");
  });
}
