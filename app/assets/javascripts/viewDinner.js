function viewDinner(dinnerID) {
    event.preventDefault();
    $.get("/dinners/" + dinnerID + ".json", function(data) {
        $("#dinnerDetails-" + dinnerID).html("");
        var dinner = data;
        if (dinner.dishes.length > 1) {
            for (var dish in dinner.dishes) {
                $("#dinnerDetails-" + dinnerID).append("<br><div class=tighter id=dishDetails-" + dinner.dishes[dish].id + "><a href='/admin/dishes'>" + dinner.dishes[dish].name + "</a></div>")
                $("#dinnerDetails-" + dinnerID).append("<ul class=tighter>")
                for (var ingredient in dinner.dishes[dish].ingredients) {
                    $("#dinnerDetails-" + dinnerID).append("<li>" + dinner.dishes[dish].ingredients[ingredient].name + "</li>")
                }
                $("#dinnerDetails-" + dinnerID).append("</ul>")
            }
        } else {
            var dish = dinner.dishes[0];
            $("#dinnerDetails-" + dinnerID).append("<br><div id=dishDetails><a href='/admin/dishes'>" + dish.name + "</a></div>")
            $("#dinnerDetails-" + dinnerID).append("<ul class=tighter>")
            if (dish.ingredients.length > 1) {
                for (var ingredient in dish.ingredients) {
                    $("#dinnerDetails-" + dinnerID).append("<li>" + dish.ingredients[ingredient].name + "</li>")
                }
            }
            $("#dinnerDetails-" + dinnerID).append("</ul>")
        }
    });
};
