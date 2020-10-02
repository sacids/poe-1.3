/* ------------------------------------------------------------------------------
 *
 *  # Custom JS code
 *
 *  Place here all your custom js. Make sure it's loaded after app.js
 *
 * ---------------------------------------------------------------------------- */
//chosen select
// In your Javascript (external .js resource or <script> tag)
$(document).ready(function() {

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
