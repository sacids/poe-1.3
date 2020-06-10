/* ------------------------------------------------------------------------------
 *
 *  # Custom JS code
 *
 *  Place here all your custom js. Make sure it's loaded after app.js
 *
 * ---------------------------------------------------------------------------- */

function get_districts() {
    const data = { "region_id": $('#region_id') };
    $.ajax({
        url: window.location.origin + "/districts/",
        type: 'post',
        data: data,
        success: function (result) {
            var e = $('#district_id')
            if (result.responseText)
                e.update(result.responseText)
        },
        error: function (error) {
            console.log('Error ${error}')
        }
    });
}


//suggest districts
function suggest_districts() {
    let region_id = document.getElementById('region_id').value;

    // Set te random number to add to URL request
    let base_url = window.location.origin;
    nocache = Math.random();

    //XMLhttpRequest Object
    let xhr = new XMLHttpRequest(),
        method = "POST",
        url = base_url + '/auto_districts/';

    console.log("url => " + url)

    xhr.open(method, url, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            let e = document.getElementById('district_id');
            if (xhr.responseText != "")
                e.innerHTML = xhr.responseText
        }
    };
    xhr.send('region_id=' + region_id);
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
