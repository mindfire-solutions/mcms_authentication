=begin

  @File Name                            :home_controller.rb

	@Company Name                         :Mindfire Solutions Pvt. Ltd.

	@Creator Name                         :Indranil Mukherjee

	@Date Created                         :2012-06-04

  @Date Modified                        :2012-06-14

  @Last Modification Details            :Making it as mcms project standard

  @Purpose                              :This is a controller which has only one action index
                                         which is the root of the application.

=end

class HomeController < ApplicationController




  # This is basically the root path of the application.
  # authentication required because everything will start by superuser
  # in authentication module



  before_filter :authenticate_user!

  #layout HOME_LAYOUT

  #layout HOME_LAYOUT
 # layout "mcms/main_layout"


 # check if mcms core layout exists
  if Gem.available?('mcms')

   #if yes then use core layout
   layout "mcms/main_layout"

  elsif Gem.available?('mcms_pages')# if not

    # use page's default layout
    layout "mcms_pages/layouts/mcms_layout"

  end # end if
  
  #  @Params                               : No parameter
  #  @Returns                              : Nothing is returned
  #  @Purpose                              : Home page action

  def index

  end


end
