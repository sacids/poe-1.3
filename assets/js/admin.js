

/* Set the width of the side navigation to 250px and the left margin of the page content to 250px and add a black background color to body */
function openNav() {
    document.getElementById("mySidenav").style.width = "290px";
    document.getElementById("main").style.marginLeft = "290px";
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0, and the background color of body to white */
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft = "0";
}


$(document).ready(function(){

    window.onscroll = function() {stick_nav()};
    // Get the navbar
    var navbar = document.getElementById("navbar");
    // Get the offset position of the navbar
    var sticky = navbar.offsetTop;
    // Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
    function stick_nav() {
        if (window.pageYOffset >= sticky) {
        navbar.classList.add("sticky")
        } else {
        navbar.classList.remove("sticky");
        }
    }
    
    $('.fa-search').on('click', function(){
        $(".site-search").addClass('search-visible');
    });

    $('.fa-times-circle').on('click', function(){
        $(".site-search").removeClass('search-visible');
        $("#site_search").val('');
        oTable.search($(this).val()).draw() ;
    });

    $(document).on('click','#set_poe_btn',function(event){

        var poe_id      = $('#set_poe').val();
        var url     = window.location.origin+'/common/set_poe?poe_id='+poe_id;

        var jqXHR = $.ajax({
            type:"GET",
            url:url
        }).done(function (data){
            
            $('#poe_title').html(data);
            location.reload();

        }).fail(function(jqXHR, textStatus, errorThrown){
            alert('Failed to update PoE');
            if ( console && console.log ) {
                console.log("Loading Ajax: " + textStatus + ", " + errorThrown);
            }

        }).always(function() {

        });

    });
    

});