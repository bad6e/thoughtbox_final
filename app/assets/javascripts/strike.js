$(document).ready(function(){
  getLinks();
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
    renderLinks(link)
  });
};

function renderLinks(link) {
  $('#link-list').prepend("<div class='all-links'><strong>Title: "
    + link.title
    + "</strong><br><div class='read-status'id='"
    + link.read_status
    + "'style='display: none;'></div><div class='stuff'><div class='"
    + link.id
    + "' style='display: none;'></div><strong>Link: "
    + link.link
    + "</strong> <input class='btn btn-default read' type='button' name='submit' value='Mark as Read'> <input class='btn btn-default unread' type='button' name='submit' value='Mark as Unread'><a href='/links/"
    + link.id
    + "/edit'>Edit</a><br><br>"
    );
  strikeThrough();
  removeStrikeThrough();
};







