function filter(){
  $("#filter").keyup(function(){
    var filter = $(this).val(), count = 0;

    $(".all-links").each(function(){
      if ($(this).text().search(new RegExp(filter, "i")) < 0) {
          $(this).fadeOut();
      } else {
        $(this).show();
        count++;
      }
    });

    var numberItems = count;
    $(".filter-count").text("Number of Comments = "+count);
  });
}

