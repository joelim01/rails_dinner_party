# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
  User has many reservations
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  Comments belong to user and commentable, a polymorphic association for dinners and dishes
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  Users have many dinners through reservations
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  Reservations keep track of how many people are coming... reservation.party_of
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  User, Dish, Comment, Dinner
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  Dinner.in_the_future, Dinner.in_the_past, /users/:id/reservations
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
admin/dinners/new, Ingredient
- [x] Include signup (how e.g. Devise)
Devise
- [x] Include login (how e.g. Devise)
Devise
- [x] Include logout (how e.g. Devise)
Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
Devise/OmniAuth GoogleOAuth2
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
users/:id/reservations
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
users/:id/reservations/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
admin/dinners/new (date field cannot be blank or invalid date, returns validation errors)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
