/* ------------------------------------------------------------------------------
 *
 *  # Custom JS code
 *
 *  Place here all your custom js. Make sure it's loaded after app.js
 *
 * ---------------------------------------------------------------------------- */

//suggest districts
function suggest_districts() {
    let region_id = document.getElementById('region_id').value;

    // Set te random number to add to URL request
    let base_url = document.getElementById('base_url').value;
    nocache = Math.random();

    // pre-fill FormData from the form
    let formData = new FormData();

    // add one more field
    formData.append("region_id", region_id);

    //XMLhttpRequest Object
    let xhr = new XMLHttpRequest(),
        method = "POST",
        url = base_url + 'welcome/get_districts/' + region_id;

    xhr.open(method, url, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            let response = xhr.responseText;
            e = document.getElementById('district_id');
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

//suggest poe
function suggest_poe() {
    let transport_means = document.getElementById('transport_means').value;

    // Set te random number to add to URL request
    let base_url = document.getElementById('base_url').value;
    nocache = Math.random();

    //XMLhttpRequest Object
    let xhr = new XMLHttpRequest(),
        method = "POST",
        url = base_url + 'welcome/get_poe/' + transport_means;

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
