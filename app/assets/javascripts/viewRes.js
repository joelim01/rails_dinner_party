function viewRes(dinnerId) {
  event.preventDefault();
  $.get("/dinners/" + dinnerId + "/reservations.json", function(data) {
     var res = data;
     $(".reservations-" + dinnerId).html("")
     $(".reservations-" + dinnerId).append("<h6>Parties of:</h6>")
     if (res.length > 1) {
       for (var r in res) {
         $(".reservations-" + dinnerId).append("<li><a href=# data-resID="+res.id+">"+res[r].party_of+"</a></li>")
       }
     } else {
       $(".reservations-" + dinnerId).append("<li><a href=# data-resID="+res.id+">"+res.party_of+"</a></li>")
    }
  });
};
