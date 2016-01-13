$(document).ready(function(){
  getLinks();
  sorter();
  filter();
});

function strikeThrough() {
  $('.read').on('click', function(){
    console.log("y")
    $(this).parent().css("text-decoration", "line-through");
    $(this).parent().parent().removeClass('false').addClass('true');
    var id = $(this).parent().children().first().attr('class');
    editLinkStatus(id, true);
  });
}

function removeStrikeThrough() {
  $('.unread').on('click', function(){
    $(this).parent().css("text-decoration", "none");
    $(this).parent().parent().removeClass('true').addClass('false');
    var id = $(this).parent().children().first().attr('class');
    editLinkStatus(id, false);
  });
}

function editLinkStatus(id, status) {
  var linkParams = {
    link: {
      read_status: status
    }
  };
  postEditLink(linkParams, id);
}

function postEditLink(linkParams, id) {
  $.ajax({
    type: 'PUT',
    data: linkParams,
    url: '/api/v1/links/' + id,
    success: function(response){
      console.log(response);
    },
    error: function(){
      console.log("error");
    }
  });
}

function getLinks(){
  $.getJSON('/api/v1/links', function(response){
    parseLinks(response);
  });
}

function parseLinks(response) {
  $.each(response, function(i, link) {
    renderLinks(link);
  });
}

function showReadLinks() {
  $('.showread').on('click', function(){
    toggle('block', 'true');
    toggle('none', 'false');
  });
}

function showUnreadLinks() {
  $('.showunread').on('click', function(){
    toggle('block', 'false');
    toggle('none', 'true');
  });
}

function toggle(displayState, boolean) {
  var trueClass = document.getElementsByClassName(boolean);
    for (var i = 0; i < trueClass.length; i++){
      trueClass[i].style.display = displayState;
  }
}

function sorter() {
  $('.alpha').on('click', function(){
    var alphabeticallyOrderedDivs = $("div.all-links").sort(function(a,b){
      return $(a).find("h3").text() > $(b).find("h3").text();
    });
  $("#link-list").html(alphabeticallyOrderedDivs);
  strikeThrough();
  removeStrikeThrough();
  });
}

function renderLinks(link) {
  $('#link-list').prepend("<div class='all-links false'><strong><h3>Title: "
    + link.title
    + "</h3></strong><br><div class='read-status'style='display: none;'></div><div class='button'><div class='"
    + link.id
    + "' style='display: none;'></div><strong><h4>Link: "
    + link.link
    + "</h4></strong> <input class='btn btn-default read' type='button' name='submit' value='Mark as Read'> <input class='btn btn-default unread' type='button' name='submit' value='Mark as Unread'></div><a href='/links/"
    + link.id
    + "/edit'>Edit</a><br><br>"
    );
  strikeThrough();
  removeStrikeThrough();
  showUnreadLinks();
  showReadLinks();
};

