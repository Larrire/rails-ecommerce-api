module Admin::V1
  class SystemRequirementsController < ApiController

    def index
      @system_requirements = SystemRequirement.all
    end

    def create
      @system_requirement = SystemRequirement.new
      @system_requirement.attributes = system_requirement_params
      @system_requirement.save!
      render :show
    rescue
      render_error(fields: @system_requirement.errors.messages)
    end

    def update
      @system_requirement = SystemRequirement.find(params[:id])
      @system_requirement.attributes = system_requirement_params
      @system_requirement.save!
      render :show
    rescue
      render_error(fields: @system_requirement.errors.messages)
    end
    
    private

    def system_requirement_params
      return {} unless params.has_key?(:system_requirement)
      params.require(:system_requirement).permit(
        :name,
        :operational_system,
        :storage,
        :processor,
        :memory,
        :video_board
      )
    end

  end
end