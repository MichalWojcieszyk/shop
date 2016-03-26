# Shop app

Rails application with list of products and its categories. User can CRUD products, assign it to the category and add a review.

### Implemented Features:
* authentication using [devise](https://github.com/plataformatec/devise)
* create decorators with [draper](https://github.com/drapergem/draper)
* some JQuery panels for product or review adding
* admin panel with [administrate](https://github.com/thoughtbot/administrate) gem
* pagination of products list by [will_paginate](https://github.com/mislav/will_paginate)
* voting system with gem [acts_as_votable](https://github.com/ryanto/acts_as_votable)
* file (photos in this app) uploads with [carrierwave](https://github.com/carrierwaveuploader/carrierwave) and wrap it using [MiniMagic](https://github.com/minimagick/minimagick)
* safe markdown parsing using [redcarpet](https://github.com/vmg/redcarpet)
* [rspec-rails](https://github.com/rspec/rspec-rails) and others for models and controllers testing 