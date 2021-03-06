=begin

  @File Name                            :mcms_authentication_generator.rb

	@Company Name                         :Mindfire Solutions Pvt. Ltd.

	@Creator Name                         :Indranil Mukherjee

	@Date Created                         :2012-06-14

  @Date Modified                        :2012-06-25

  @Last Modification Details            :Making it as mcms project standard

  @Purpose                              :This file is responsible to install mcms_authentication module in other application/module

=end

class McmsAuthenticationGenerator < Rails::Generators::NamedBase
  
  source_root File.expand_path('../templates', __FILE__)

  desc "Installing MCMS_AUTHENTICATION"

  #  @Params                               : No parameter
  #  @Returns                              : Nothing is returned 
  #  @Purpose                              : Copies all the migrations

  def add_migrations

    say "Copying migrations........."

    rake("mcms_authentication_engine:install:migrations")

    # create file deb/seeds.rb to parent app if not exists
    create_file "db/seeds.rb" unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))

    # append data to app's seeds.rb
    append_file 'db/seeds.rb', :verbose => true do

      <<-EOH

        McmsAuthentication::Engine.load_seed

      EOH

    end # end block
  
  end

  #  @Params                               : No parameter
  #  @Returns                              : Nothing is returned 
  #  @Purpose                              : Copies all the libraries required

  def copy_core_libraries

    copy_file "models.rb", "lib/mcms_authentication/models.rb" # module logic
    
  end

  #  @Params                               : No parameter
  #  @Returns                              : Nothing is returned
  #  @Purpose                              : Configurations are done here
  
  def configure
    original_app = File.binread("app/controllers/application_controller.rb")

    if((original_app.include?("include ApplicationHelper")) && (original_app.include?("def after_sign_in_path_for(resource)")))
      
      say_status("skipped", "insert into app/controllers/application_controller.rb", :yellow)

    else

      insert_into_file File.join('app/controllers', 'application_controller.rb'), :after => "ActionController::Base\n" do


        '
        include ApplicationHelper #including application_helper for the availability of filters
        #  The following snippet is responsible for rescuing from exception generated by CanCan gem
                  #  for denying a particular module access with a notice to user and redirecting to root_url
                  rescue_from CanCan::AccessDenied do |exception|

                       flash[:error] = t(:access_denied,:default => "You are not authorized for doing this operation")

                       if Gem.available? ("mcms")
                        redirect_to "/mcms/dashboard"
                       else
                        "/"
                       end

                  end

                   def after_sign_in_path_for(resource)
                      if Gem.available? ("mcms")
                        "/mcms/dashboard" # <- Path you want to redirect the user to.
                      else
                        "/"
                      end

                   end

          #end of configuration

        '
      end
    end
    
  end

  #  @Params                               : No parameter
  #  @Returns                              : Nothing is returned 
  #  @Purpose                              : Final instructions for developers who will use the gem

  def prompt_user

    unless Gem.available? ("mcms")
      
      say "\ndon't forget to run the following \n
          
          rake db:migrate\n

          in the controllers where you want to apply auth\n

          prepend_before_filter :authenticate_user!  \n

          load_and_authorize_resource  \n

          Enjoy!\n\n"
    end

  end


  
end
