1 - clone the repo to the local machine & cd into the directory 
2 - Change Text 

	a.		app/views/elements/_navbar.html.erb:
          	<%= link_to "Omnia", defined?(root_path) ? root_path : "#", class: "navbar-brand" %>

    b.		app/views/layouts/application.html.erb:
    	    <title>OmniaWebsiteBase</title>

   	c. 		config/application.rb:
    		module OmniaWebsiteBase

    d. 		omnia_website_base/config/database.yml:
   			database: omnia_website_base_development
   			#username: omnia_website_base
   			database: omnia_website_base_test
   			database: omnia_website_base_production
   			username: omnia_website_base
   			password: <%= ENV['OMNIA_WEBSITE_BASE_DATABASE_PASSWORD'] %>

   	e.  	config/initializers/session_store.rb:
    		Rails.application.config.session_store :cookie_store, key: '_omnia_website_base_session'

    f.		/config/initializers/active_admin.rb:
    	   	config.site_title = "Omnia Website Base"

3 - run ./prelang-init
4 - run rake db:migrate 

5 - Settings to change : 

        fog_directory: 'zdemob' - Should set up a new bucket on AWS to use for each site 

        Change Google API key for each site
        google_api_key: 'AIzaSyCPWcKLskhflXwbEAYsO9pQ5rtzwUv1SVY'
