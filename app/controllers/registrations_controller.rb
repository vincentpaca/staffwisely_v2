class RegistrationsController < Devise::RegistrationsController
  def new
    resource = build_resource({})
    resource.build_company
    respond_with resource
  end

  def create
    resource = build_resource(params[:user])

    if resource.save
      sign_in(resource_name, resource)
      respond_with resource, :location => after_sign_up_path_for(resource)
    else
      render :action => "new"
    end
  end

  def update
    super
  end
end
