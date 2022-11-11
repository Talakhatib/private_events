class InvitationsController < ApplicationController
    
    def create
        invitation = Invitation.new(inviter_id: params[:user_id],invited_id: params[:invited_user],event_id: params[:event_id])
        @current_user = params[:user_id]
        if invitation.save
            redirect_to user_path(@current_user )
        else 
            flash[:danger] = "Failed to invite user !!"
            redirect_to user_path(@current_user)
        end
    end
    private 

    def invitation_params 
        params.require(:invitation).permit(:user_id,:event_id,:invited_users)
    end
end
