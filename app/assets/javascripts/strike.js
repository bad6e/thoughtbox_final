$(document).ready(function(){
  strikeThrough();
  removeStrikeThrough();
});

function strikeThrough(){
  $('.read').on('click', function(){
    $(this).parent().css("text-decoration", "line-through");
    var id = $(this).parent().children().first().attr('class')
    editLinkStatus(id, true);
  });
}

function removeStrikeThrough(){
  $('.unread').on('click', function(){
    $(this).parent().css("text-decoration", "none");
    var id = $(this).parent().children().first().attr('class');
    editLinkStatus(id, false);
  });
}

function editLinkStatus(id, status) {
  var linkParams = {
    link: {
      read_status: status
    }
  }
  postEditLink(linkParams, id)
}

function postEditLink(linkParams, id){
  $.ajax({
    type: 'PUT',
    data: linkParams,
    url: '/api/v1/links/' + id,
    success: function(response){
      console.log("SHIP")
    },
    error: function(){
    }
  })
}

