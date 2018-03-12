$(document).ready(function () {
    loadNext5();
});

function loadNext5() {
    $.ajax({
        url: "http://127.0.0.1:8443/races",
        type: "GET",
        dataType: "json"
    }).then(function (response) {
        $.each(response, function (i, item) {
            $("#next5 tbody").append(
                "<tr class='view-race-" + item.id + "'>"
                + "<td class='left' on><img src='img/" + item.name + ".jpg'></td>"
                + "<td>" + item.location + "(" + item.id + ")</td>"
                + "<td id='next5-count-" + item.id + "'>" + item.close_time + "</td>"
                + "</tr>");

            $("#next5-count-" + item.id)
                .countdown(item.close_time, function (event) {
                    $(this).text(event.strftime('%-H h %M min %S sec'));
                });

            $(".view-race-"  + item.id).click(function () {
                console.log("alert");
                const id = $(this).data("id");
                $.ajax({
                    url: "http://127.0.0.1:8443/race/" + item.id,
                    type: "GET",
                    dataType: "json"
                }).then(function (response) {
                    $(".starter-template").html(
                        "<p><strong>Meeting: </strong>" + item.location + "(" + item.id + ")</p>"
                        + "<p><strong>Category:</strong> " + item.name + "</p>"
                        + "</tr>");
                });
            });
        });
    });
}