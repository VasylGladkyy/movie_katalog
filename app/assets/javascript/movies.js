$(document).on('tutbolinks:load', function(){
  let movies = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '/movies/autocomplete?query=%QUERY',
      wildcard: '%QUERY'
    }
  });
  $('#movies_serch').typeahead(null, {
    source: movies
  });
})