function viewRes(dinnerId) {
  event.preventDefault();
  $.get("/dinners/" + dinnerId + "/reservations.json", function(data) {
     var res = data;
     $(".reservations-" + dinnerId).append("<h6>Parties of:</h6>")
     if (typeof res === "array") {
       for (var r in res) {
         $(".reservations-" + dinnerId).append("<ul><li><a href=#>"+res[r].party_of+"</a></li></ul>")
       }
     } else {
       $(".reservations-" + dinnerId).append("<ul><li><a href=/admin/reservations/"+res.id+"/edit>"+res.party_of+"</a></li></ul>")
    }
  });
};
