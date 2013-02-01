$(document).on "click", "#proposeBtn", (e) ->
  e.preventDefault()

  $("#show-proposal").addClass("hide")
  $("#submit-proposal").removeClass("hide")
