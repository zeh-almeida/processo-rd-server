class VisitationsController < ApplicationController

  has_scope :by_visitor
  has_scope :by_address

  # GET /visitations
  # GET /visitations.json
  def index
    @visitor_id  = params[:visitor_id]
    @visitations = apply_scopes(Visitor.find(@visitor_id).visitations).page(params[:page])

    respond_with @visitations, status: @visitations.exists? ? :ok : :not_found do |format|
      format.html{ flash[:info] = I18n.t('simple_form.result', count: @visitations.count) }
      format.js
      format.json
    end
  end
end
