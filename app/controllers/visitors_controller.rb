class VisitorsController < ApplicationController
  protect_from_forgery with: :exception, except: [:create]

  before_action :set_visitor,  only: [:show]
  before_action :validate_api, only: [:create]

  has_scope :by_email

  # GET /visitors
  # GET /visitors.json
  def index
    @visitors = apply_scopes(Visitor.all)
                       .select(:id, :email, :created_at, :updated_at)
                       .order(:updated_at, :email)
                       .page(params[:page])

    respond_with @visitors do |format|
      format.html{ flash[:info] = I18n.t('simple_form.result', count: @visitors.count) }
      format.js
      format.json
    end
  end

  # GET /visitors/1
  # GET /visitors/1.json
  def show
    respond_with @visitor do |format|
      format.html
      format.json
    end
  end

  # POST /visitors
  # POST /visitors.json
  def create
    @visitor = Visitor.by_email(visitor_params[:email]).first

    if @visitor.present?
      @visitor.attributes = visitor_params
    else
      @visitor = Visitor.new(visitor_params)
    end

    respond_with @visitor, status: @visitor.save ? :created : :unprocessable_entity do |format|
      format.json{ render json: @visitor.to_json }
    end
  end

  private

    def set_visitor
      @visitor = Visitor.find(params[:id])
    end

    def visitor_params
      params.require(:visitor)
            .permit(:email, visitations_attributes: [ :id, :address, :time])
    end

    def validate_api
      return if ApiKey.exists?(key: params[:api_key])

      respond_with do |format|
        text = I18n.t('activerecord.errors.models.api_keys.key_not_found')
        format.json { render json: text, status: :unauthorized }
      end
    end
end
