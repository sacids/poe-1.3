/* ------------------------------------------------------------------------------
 *
 *  # Custom JS code
 *
 *  Place here all your custom js. Make sure it's loaded after app.js
 *
 * ---------------------------------------------------------------------------- */
//ready 
$(document).ready(function () {
    //age change
    $('#age_category').on("change", function () {
        age_category = $(this).val();

        if (age_category === 'above') {
            $('#age_cat').text("{% trans ' (In years) ' %}");
        } else if (age_category === 'below') {
            $('#age_cat').text("{% trans ' (In months) ' %} ");
        }
    });

    //asteriskField in seat number
    $('#mode_of_transport').on("input", function () {
        mode_of_transport = $(this).val();

        if (mode_of_transport === 'flight') {
            $('#seat_astr').text("*");
        } else {
            $('#seat_astr').text("");
        }
    });

    //asteriskField in duration of stay
    $('#nationality').on("input", function () {
        nationality = $(this).val();

        if (nationality != '217') {
            $('#dur_stay_astr').text("*");
        } else {
            $('#dur_stay_astr').text("");
        }
    });

});

//suggest districts
function suggest_districts() {
    let region_id = document.getElementById('region_id').value;

    // Set te random number to add to URL request
    let base_url = window.location.origin;
    nocache = Math.random();

    //XMLHttpRequest Object
    let xhr = new XMLHttpRequest(),
        method = "GET",
        url = base_url + '/auto_districts/?region_id=' + region_id;

    xhr.open(method, url, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            let e = document.getElementById('district_id');
            if (xhr.responseText !== "") {
                e.innerHTML = xhr.responseText;
                e.style.display = "block";
            } else {
                e.style.display = "none";
            }
        }
    };
    xhr.send();
}

//suggest point_of_entries
function suggest_point_of_entries() {
    let mode_of_transport = document.getElementById('mode_of_transport').value;

    // Set te random number to add to URL request
    let base_url = window.location.origin;
    nocache = Math.random();

    //XMLHttpRequest Object
    let xhr = new XMLHttpRequest(),
        method = "GET",
        url = base_url + '/auto_point_of_entries/?mode_of_transport=' + mode_of_transport;

    xhr.open(method, url, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            let response = xhr.responseText;
            e = document.getElementById('point_of_entry');
            if (response !== "") {
                e.innerHTML = response;
                e.style.display = "block";
            } else {
                e.style.display = "none";
            }
        }
    };
    xhr.send();
}
