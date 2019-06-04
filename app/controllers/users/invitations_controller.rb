class Users::InvitationsController < Devise::InvitationsController

   before_action :initial_invited_user, only: [:new, :edit, :update]

   def create
     @user = User.invite!(invited_user_params)
     if @user.valid?
       redirect_to new_user_invitation_path, notice: "User #{invited_user_params[:email]} has been invited."
     else
       render 'users/invitations/new', locals: { resource: @user, resource_name: resource_name }
     end
   end

   def update
     user = User.accept_invitation!(invited_user_params)
     if user.valid?
       redirect_to root_path, notice: ''
     else
       super
     end
   end

   private
     def initial_invited_user
        @user = User.find_by_invitation_token(params[:invitation_token], true) || User.new
     end

     def invited_user_params
       params.require(:user).permit(:name, :email, :role_id, :password,
                                    :invitation_token, location_list: [], company_ids: [])
     end
 end
