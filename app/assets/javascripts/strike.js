$(document).ready(function(){
  strikeThrough();
  removeStrikeThrough();
});

function strikeThrough(){
  $('.read').on('click', function(){
    $(this).parent().css("text-decoration", "line-through");
    var id = $(this).parent().children().first().attr('class')
    editLinkStatus(id);
  });
}

function removeStrikeThrough(){
  $('.unread').on('click', function(){
    $(this).parent().css("text-decoration", "none");
  });
}


function editLinkStatus(id) {
  debugger
  var linkParams = {
    link: {
      read_status: 'true'
    }
  }
  postEditLink(linkParams, link, id)
}

function postEditIdea(linkParams, idea, id){
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

//         postEditIdea(ideaParams, idea, ideaID)
//       })
//   })
// }
