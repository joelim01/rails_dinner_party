function setModal() {

  // set close modal behaviour
  $('.close-modal').click(function() {
      console.log('clicked');
      $('.modal').toggleClass('modal-open');
  	});
  // close modal if clicked outside content area
  $('.modal-inner').click(function() {
    console.log('clicked outside');
    $('.modal').toggleClass('modal-open');
  });
  // prevent modal inner from closing parent when clicked
  $('.modal-content').click(function(e) {
    console.log('prop');
  	e.stopPropagation();
  });
};
