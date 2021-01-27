class AfterSignupController < ApplicationController
    before_action :authenticate_user!
    include Wicked::Wizard

    steps :stepone, :steptwo, :stepthree

    def show
        @user = current_user
        case step
    when :terms
      # @terms = Term.find(X)
    when :privacy
    when :user_information
    end
        sign_in(@user, bypass: true)
        render_wizard
      end

    def update
        @user = current_user
        case step
        when :stepthree
          @user.assign_attributes(user_params)
        end
        sign_in(@user, bypass: true) # needed for devise
        render_wizard @user
      end
    
      private
      def redirect_to_finish_wizard(options, params)
        redirect_to root_path, notice: 'Thank you for signing up.'
      end
      def user_params
        params.require(:user)
          .permit(:instagramhandle, :youtubehandle, :instagramprice, :youtubeprice, :gender, :dob, :city, :phonenumber, :primarycat, :secondarycat)
      end
end
