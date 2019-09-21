$(function() {

    // When user click on link
    $("a.building_names").on("click", function(b) {

        //debugger
        // fire ajax data 
        $.ajax({
            method: "GET",
            url: this.href // WHAT URL DO WE WANT TO FIRE THIS REQUEST TO? 
        }).done(function(data) {
            // Get the response (its's the variable data)

            console.log(data)

            // We'd really want to load that data into the DOM (add it to the current page)
        });

        // load that response into the HTML of the page. 
        b.preventDefault();
    })
})