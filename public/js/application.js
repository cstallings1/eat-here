$(document).ready(function() {
  $("#login_link").on("click", function(event){
    event.preventDefault();
    $("#login_form").toggle( "slow", function() {
    });
  });

  $("#register_link").on("click", function(event){
    event.preventDefault();
    $("#register_form").toggle( "slow", function() {
    });
  });
  $("#search-form").on("submit", function(e){
    e.preventDefault();

  var route = $("#search-form").attr("action")
  var formData = $("#search-form").serialize();
  var request = $.ajax({
    method: "POST",
    url: route,
    data: formData,
  });

  request.done(function(response){
    $(".left-col").append(response);
  });
  });

  // $("body").on("submit", "#add-restaurant", function(e){
  //   e.preventDefault();

// $("#add-restaurant").attr("action");
//     var route = $("#add-restaurant").attr("action");
//     var formData = $("#add-restaurant").serialize();

//     var request = $.ajax({
//       method: "POST",
//       url: route,
//       data: formData,
//     });

//     request.done(function(response){
//       console.log(response);
//     });

//     // $(".business-search-list").remove();
//   });


});
