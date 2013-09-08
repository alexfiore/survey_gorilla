$(document).ready(function() {

  $("#survey_title").on('submit', function(e){
    e.preventDefault();
    $.ajax({
      url: this.action,
      type: this.method,
      data: $(this).serialize()
    }).done(function(data){
      $("#binding_div").append(data);
      $("#survey_title input[type=submit]").hide();
    }).fail(function(){
        console.log("error");
    });
  });

  $("#binding_div").on("click", "#question_text", function(e){
    e.preventDefault();
    $.ajax({
      url: this.action,
      type: this.method,
      data: $(this).serialize()
    }).done(function(data){
      $("#binding_div").append(data);
      $("#add_choices").hide();
    }).fail(function(data){
      console.log("error");
    });
  });

  $("#binding_div").on("click", "#choice_text", function(e){
    e.preventDefault();
    $.ajax({
      url: this.action,
      type: this.method,
      data: $(this).serialize()
    }).done(function(data){
      $("#binding_div").append(data);
      $("#new_choice").hide();
      $("input type[type=submit]").hide();
    }).fail(function(data){
      console.log("error");
    });
  });

});

