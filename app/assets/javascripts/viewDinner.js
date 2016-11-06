function viewDinner(dinnerID) {
    event.preventDefault();
    $("#dinnerDetails-" + dinnerID).html("");
    var promise = getDinner(dinnerID);
    promise.then(function(data) {
        var dinner = data
        if (dinner.dishes.length > 1) {
            for (var dish in dinner.dishes) {
                updateDishDisplay(dinner.dishes[dish], dinnerID)
            }
        } else {
            var dish = dinner.dishes[0];
            updateDishDisplay(dish, dinnerID);
        }

    });
};

function getDinner(id) {
    return Promise.resolve($.get("/dinners/" + id + ".json"));
};

function updateDishDisplay(dish, id) {
    $("#dinnerDetails-" + id).append("<br><div class=tighter id=dishDetails-" + dish.id + "><a href='/admin/dishes'>" + dish.name + "</a></div>");
    $("#dinnerDetails-" + id).append("<ul class=tighter>");
    for (var ingredient in dish.ingredients) {
        $("#dinnerDetails-" + id).append("<li>" + dish.ingredients[ingredient].name + "</li>");
    };
    $("#dinnerDetails-" + id).append("</ul>");
};
