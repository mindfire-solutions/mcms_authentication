=begin

  @File Name                            :mcms_authentication::engine.rb

	@Company Name                         :Mindfire Solutions Pvt. Ltd.

	@Creator Name                         :Indranil Mukherjee

	@Date Created                         :2012-06-14

  @Date Modified                        :2012-06-25

  @Last Modification Details            :Making it as mcms project standard

  @Purpose                              :This file is responsible to install mcms_authentication module in other application/module

=end

module McmsAuthentication
  class Engine < ::Rails::Engine
    require 'devise'
    require "cancan"

    config.to_prepare do
      
      if Gem.available?('mcms')

        #if yes then use core layout
        Devise::SessionsController.layout "mcms/main_layout"
        Devise::PasswordsController.layout "mcms/main_layout"
        
      elsif Gem.available?('mcms_pages')# if not

        # use page's default layout
    
        Devise::SessionsController.layout "mcms_pages/layouts/mcms_layout"
        Devise::PasswordsController.layout "mcms_pages/layouts/mcms_layout"
        
      end # end if

      
    end

    # Custom directories with classes and modules you want to be autoloadable.
    config.autoload_paths += %W(#{config.root}/lib)

    config.autoload_paths += Dir["#{config.root}/lib/**/"]
  end
end
