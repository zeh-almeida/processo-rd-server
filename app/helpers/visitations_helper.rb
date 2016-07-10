
module VisitationsHelper
  def visitation_table_item(visitation)
    Rails.cache.fetch("visitation-#{visitation.id}-#{visitation.updated_at}") do
      content_tag(:tr) do
        concat(content_tag(:td, visitation.address))
        concat(content_tag(:td, I18n.l(visitation.created_at, format: :small)))
        concat(content_tag(:td, I18n.l(visitation.updated_at, format: :small)))
      end
    end
  end
end
