class Reservation {
  constructor(id, partySize) {
  this.id = id;
  this.party_of = partySize;
}

  update() {
    var reservation = { reservation: this };
    $.ajax({
        method: 'patch',
        url: 'reservations/' + this.id + '.json',
        data: reservation
      }).done(function(){

      })
    };
  };
