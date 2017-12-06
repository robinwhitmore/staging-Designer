$(document).ready(function() {

  // Tooltips - BootstrapJS
  $('[data-toggle="tooltip"]').tooltip({
    placement : 'top'
  });

  // Popovers - BootstrapJS
  $('[data-toggle="popover"]').popover({
    placement: 'top',
    trigger: 'hover',
    html: true
  });

  // AnchorJS
  anchors.add('h2, h3, h4, h5');

  // Mobile Nav
  $('.mobile-nav-btn').on('click', function(event) {
      $('.nav-group').toggleClass('open');
  });

  // Sidebar
  // Navgoco lib handles expanding and collapsing
  $("#mysidebar").navgoco({
    caretHtml: '',
    accordion: true,
    openClass: 'active', // open
    save: false, // leave false or nav highlighting doesn't work right
    slide: {
      duration: 400,
      easing: 'swing'
    }
  });

  SimpleJekyllSearch.init({
    searchInput: document.getElementById('search-input'),
    resultsContainer: document.getElementById('results-container'),
    dataSource: 'search.json',
    searchResultTemplate: '<li><a href="{url}" title="{{page.title | replace: "\'", "\\"}}">{title}</a></li>',
    noResultsText: '<span class="no-results">No results</span>',
    limit: 10,
    fuzzy: true,
  })

});