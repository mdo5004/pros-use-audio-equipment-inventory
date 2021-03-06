# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
* Users have many rigs, rigs have many items
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
* Rigs belong to a User
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
* Users have many Items through Rigs
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
* Users can create rig items with a name
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
* Users: name, email & password
* Items: name & manufacturer
* Rigs: name
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
* Item.top_ten is a class level method that returns the top ten most popular items
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
- [x] Include signup (how e.g. Devise)
* manual implementation
- [x] Include login (how e.g. Devise)
* manual implementation
- [x] Include logout (how e.g. Devise)
* manual implementation
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
* OmniAuth lets users log in with Facebook
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
* users/1/rigs
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
* /users/1/rigs/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate