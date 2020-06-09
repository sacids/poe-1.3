
function checkScore(){

    $("tr").filter(function() {
        return parseInt($(this).children("td.score").text(), 10) > 0;
    }).css("background-color","#00CCFF");

    $("tr").filter(function() {
        return parseInt($(this).children("td.score").text(), 10) > 29;
    }).css("background-color","#FF3300");
}

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
    });
    // check scores

    $(document).on('click','.item',function(event){

        var subMenu = $(this).attr('sid');
        $('.subMenu').css({ "margin-left" : "-250px"});
        $('#'+subMenu).animate({
            marginLeft: "88px"
        });
        return;
    });

    $(document).on('click','.closeSM',function(event){

        var subMenu = $(this).closest('.subMenu').attr('id');
        $('#'+subMenu).animate({
            marginLeft: "-250px"
        });
        return;
    });

    $(document).on('click','.link', function(e){

        var url     = $(this).attr('u');
        $('.subMenu').animate({ 
            "margin-left" : "-250px"
        });

        e.preventDefault();
        // dim & progress
        $('#content').html('<div class="d-flex justify-content-center">'+
                '<div class="spinner-border" role="status">'+
                    '<span class="sr-only">Loading...</span>'+
                '</div>'+
            '</div>');
    
        var jqXHR = $.ajax({
            type:"POST",
            url:window.location.origin+'/'+url,
        }).done(function (data){

            $('#content').html(data);

        }).fail(function(jqXHR, textStatus, errorThrown){

            $('#content').html('Temporary error, please try again');

            if ( console && console.log ) {
                console.log("Loading Ajax: " + textStatus + ", " + errorThrown);
            }
        }).always(function() {
        });

        // Avoid submit event to continue normal execution
        e.preventDefault();
        return false;
    });


    $(document).on('click','.item_manage .tab-item', function(e){

        $('.item_manage .tab-item').removeClass('active');
        $(this).addClass('active');

        var method  = $(this).attr('act');
        var data    = $(this).attr('args');
        //alert(method + ' ' + data);

        $('#item_content').html('<div class="d-flex justify-content-center">'+
                '<div class="spinner-border" role="status">'+
                    '<span class="sr-only">Loading...</span>'+
                '</div>'+
            '</div>');
    
        var jqXHR = $.ajax({
            type:"POST",
            url:window.location.origin+'/'+method,
            data:data,
        }).done(function (data){

            $('#item_content').html(data);

        }).fail(function(jqXHR, textStatus, errorThrown){

            $('#item_content').html('Temporary error, please try again');

            if ( console && console.log ) {
                console.log("Loading Ajax: " + textStatus + ", " + errorThrown);
            }
        }).always(function() {
        });

        // Avoid submit event to continue normal execution
        e.preventDefault();
        return false;

    });

    $(document).on('click','.dbx_wrapper input[type="submit"]',function(){
        
         //alert('submit');
        // get the form
        var form = $(this).closest("form");
        var action = form.attr('action');
        var target ;

        if(!form.attr('target')){
            target = form.parent();
        }else{
            target = $('#'+form.attr('target'));
        }

        var data = new FormData( $(form)[0] );

        var jqXHR = $.ajax({
            type:"POST",
            url:action,
            data:data,
            mimeType: "multipart/form-data",
            contentType: false,
            cache: false,
            processData: false
        }).done(function(data){
            target.html(data);
        }).fail(function(jqXHR, textStatus, errorThrown){
            target.html('Temporary error, please try again');
            if ( console && console.log ) {
                console.log("Loading Ajax dbx: " + textStatus + ", " + errorThrown);
            }
        }).always(function(){ 

        });

        // Avoid submit event to continue normal execution
        event.preventDefault();
        return false;

    });
    

});