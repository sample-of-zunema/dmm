ActiveAdmin.register Dream do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :comment_id, :emotion, :title, :body, :start_time
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :comment_id, :emotion, :title, :body, :start_time]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
