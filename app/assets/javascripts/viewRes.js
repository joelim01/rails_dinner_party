var res_array = {};
var currentRes;

function viewRes(event) {
    event.preventDefault();
    var dinnerId = event.target.dataset.dinnid
    $.get("/dinners/" + dinnerId + "/reservations.json", function(data) {
        var res = data;
        $(".reservations-" + dinnerId).html("")
        $(".reservations-" + dinnerId).append("<h6>Parties of:</h6>")
        if (res.length > 1) {
            for (var r in res) {
                $(".reservations-" + dinnerId).append("<li><a href='' class='open-modal' data-resID=" + res[r].id + ">" + res[r].party_of + "</a></li>")
                res_array[res[r].id] = new Reservation(res[r].id, res[r].party_of);
                attachModal(res[r].id);
            }
        } else {
            $(".reservations-" + dinnerId).append("<li><a href='' class='open-modal' data-resID=" + res[0].id + ">" + res[0].party_of + "</a></li>")
            res_array[res[0].id] = new Reservation(res[0].id, res[0].party_of);
            attachModal(res[0].id)
        }
    });
  };
