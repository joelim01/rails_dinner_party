var res_array = {};
var currentRes;

function viewRes(event) {
    event.preventDefault();
    var dinnerId = event.target.dataset.dinnid
    var promise = getReservation(dinnerId);
    $(".reservations-" + dinnerId).html("")
    $(".reservations-" + dinnerId).append("<h6>Parties of:</h6>")
    promise.then(function(data) {
        var res = data;
        if (res.length > 1) {
            for (var r in res) {
                createReservation(res[r], dinnerId);
                updateReservationDisplay(res[r], dinnerId);
            }
        } else {
            createReservation(res[0], dinnerId);
            updateReservationDisplay(res[0], dinnerId);
        }
    });
};

function getReservation(id) {
    return Promise.resolve($.get("/dinners/" + id + "/reservations.json"));
};

function createReservation(reservation, dinner) {
    res_array[reservation.id] = new Reservation(reservation.id, reservation.party_of);
};

function updateReservationDisplay(reservation, dinner) {
    $(".reservations-" + dinner).append("<li><a href='' class='open-modal' data-resID=" + reservation.id + ">" + reservation.party_of + "</a></li>")
    attachModal(reservation.id);
}
