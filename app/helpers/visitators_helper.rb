
module VisitatorsHelper
  def visitor_table_item(visitor)
    Rails.cache.fetch("visitor-#{visitor.id}-#{visitor.updated_at}") do
      content_tag(:tr) do
        concat(content_tag(:td, visitor.email))
        concat(content_tag(:td, I18n.l(visitor.created_at, format: :small)))
        concat(content_tag(:td, I18n.l(visitor.updated_at, format: :small)))

        concat(content_tag(:td) do
          show_button( visitor_path(visitor.id), visitor.id, t('activerecord.models.visitor', count: 1) )
        end)
      end
    end
  end
end
