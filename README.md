# Rails Dinner Party

Rails Dinner Party is an example app created for the Learn.co Flatiron School Rails Assessment. Technical areas this project needed to cover:

* Using Ruby on Rails for the project
* Including at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
  *   Here the User has many Reservations
* Including at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) 
  *   Comments belong to User and Commentable, a polymorphic association for Dinner and Dish
* Including at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) 
  *   Users have many Dinners through Reservations
* The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity) 
  *   Reservations keep track of how many people are coming... reservation.party_of
* Including reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  *   User, Dish, Comment, Dinner all validate presence of data
* Including a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) 
  *   Dinner.in_the_future, Dinner.in_the_past, /users/:id/reservations
* Including a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
  *   admin/dinners/new, Ingredient
* Including signup: Devise
* Including login: Devise
* Including logout: Devise
* Including third party signup/login (how e.g. Devise/OmniAuth): Devise/OmniAuth GoogleOAuth2
* Including nested resource show or index (URL e.g. users/2/recipes): users/:id/reservations
* Including nested resource "new" form (URL e.g. recipes/1/ingredients): users/:id/reservations/new
* Including form display of validation errors (form URL e.g. /recipes/new): admin/dinners/new (date field cannot be blank or invalid date, returns validation errors)

The Rails Dinner Party is a simple app that allows users to create reservations for upcoming dinner parties and also to review the dishes on the menu and leave comments after the dinner party ends. Admins can create, edit, associate and delete dinners and dishes.

Users may log in by providing their own credentials or through Google OAuth2.

Get started by cloning the repo and running `bundle install`.

To get Google OAuth2 working, you'll need to have a Google account and set up an API key and secret:

>Get your API key at: https://code.google.com/apis/console/ Note the Client ID and the Client Secret.

>Note: You must enable the "Contacts API" and "Google+ API" via the Google API console. Otherwise, you will receive an >OAuth2::Error(Error: "Invalid credentials") stating that access is not configured when you attempt to authenticate.

>For more details, read the Google docs: https://developers.google.com/accounts/docs/OAuth2

For full instructions, see the Google OmniAuth Gem:
https://github.com/zquestz/omniauth-google-oauth2

Note: It is not recommended to place your API Key and Secret in the devise.rb file. Create environment variables (best) or store them in your app's secret.rb (ok) and make sure that the file is in your git ignore so that you don't end up sharing it with the world.

After config, a quick `rails s` will have you on your way in no time.
