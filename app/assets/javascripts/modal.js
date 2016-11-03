function setModal() {

  // set close modal behaviour
  $('.close-modal').click(function() {
      $('.modal').toggleClass('modal-open');
  	});
  // close modal if clicked outside content area
  $('.modal-inner').click(function() {
    $('.modal').toggleClass('modal-open');
  });
  // prevent modal inner from closing parent when clicked
  $('.modal-content').click(function(e) {
  	e.stopPropagation();
  });
};

function attachModal(resId) {
      $("a[data-resID='" + resId +"']").click(function(e) {
          e.preventDefault();
          $('.modal input')[0].value = res_array[resId].party_of;
          $('.modal').toggleClass('modal-open');
          $('.submit').off('click');
          $('.submit').click(function() {
              res_array[resId].party_of = parseInt($('.modal input')[0].value);
              res_array[resId].update(function(){
                $("a[data-resID='" + resId +"']").html(res_array[resId].party_of);
                $('.modal').toggleClass('modal-open');
              });
          });
      });
  };
