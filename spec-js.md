# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
    Show dinners at http://localhost:3000/admin/dinners (click on dinner title)
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
    Show all dinners, dinner.dishes, reservations at http://localhost:3000/admin/dinners (click on dinner title)
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
    Show dishes.ingredients at http://localhost:3000/admin/dinners (click on dinner title)
- [x] Include at least one link that loads or updates a resource without reloading the page.
    Edit dinner.reservations at http://localhost:3000/admin/dinners (click on see reservations, reservation, [modal] update reservation)
- [x] Translate JSON responses into js model objects.
    Reservations are objects.
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
    Reservations have an update() prototype function.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
