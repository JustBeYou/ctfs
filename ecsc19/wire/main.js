(function($){
    $(function(){
        var pathArray = window.location.pathname.split( '/' );
        $('ul.navbar-nav a.nav-link').removeClass('active');
        $('ul.navbar-nav a.nav-link[href="/' + pathArray[1] + '"]').parent().addClass('active');
    });
})(jQuery);