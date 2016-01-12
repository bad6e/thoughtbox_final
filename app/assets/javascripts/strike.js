$(document).ready(function(){
  getLinks();
  strikeThrough();
  removeStrikeThrough();
  showRead();
});

function strikeThrough(){
  $('.read').on('click', function(){
    $(this).parent().css("text-decoration", "line-through");
    var id = $(this).parent().children().first().attr('class');
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
  postEditLink(linkParams, id);
  getLinks();
}

function postEditLink(linkParams, id){
  $.ajax({
    type: 'PUT',
    data: linkParams,
    url: '/api/v1/links/' + id,
    success: function(response){
      console.log(response)
    },
    error: function(){
      console.log("error")
    }
  })
}

function getLinks(){
  $.getJSON('/api/v1/links', function(response){
    parseLinks(response)
  });
};

function parseLinks(response) {
  $.each(response, function(i, link) {
    // renderStatus(link)
  });
};




