module ApplicationHelper
  def bootstrap_class_for( flash_type )
    case flash_type.to_sym
      when :success
        "alert-success" # Green
      when :error
        "alert-danger" # Red
      when :alert
        "alert-warning" # Yellow
      when :notice
        "alert-success" # Blue
      when :info
        "alert-info" # Blue
      else
        flash_type.to_s
    end
  end

  def show_flash( type, message )
    klass = bootstrap_class_for( type )

    content_tag( :div, class: "alert alert-dismissible fade in #{klass} flash-message", role: 'alert' ) do
      concat( button_tag(type: 'button', class: 'close', data: { dismiss: 'alert', label: 'Close' }) do
        content_tag(:span, 'x', aria: {hidden: true} )
      end )

      concat( message )
    end
  end

  def content_index( klass )
    content_tag( :div, class: 'card' ) do
      concat( content_tag( :div, class: 'card-header' ) do
        content_tag( :div, content_tag( :h2, t("activerecord.models.#{ klass.name.downcase }", count: 2) ), class: 'col-sm-12' )
      end )

      concat( content_tag( :div, id: "table-#{ klass.name.downcase }", class: 'table-responsive col-sm-12' ) do
        yield
      end )
    end
  end

  def regular_content( title )
    content_tag( :div, class: 'card' ) do
      concat( content_tag( :div, class: 'card-header' ) do
        content_tag( :div, content_tag( :h2, title ), class: 'col-sm-12' )
      end )

      concat( content_tag( :div, class: 'col-sm-12 p-0' ) do
        yield
      end )
    end
  end

  def pagination_footer( objects )
    content_tag( :div, id: 'data-table-basic-footer', class: 'bootgrid-footer container-fluid' ) do
      content_tag( :div, class: 'col-sm-12' ) do
        concat( content_tag( :div, class: 'col-sm-6' ) do
          paginate( objects, window: 3, remote: true )
        end )

        concat( content_tag( :div, class: 'col-sm-6 infoBar' ) do
          page_entries_info( objects )
        end )
      end
    end
  end

  def command_button( path, row_id, message, additional = { } )
    options = { remote: false, role: :get, target: '_self', klass: '', confirm: false, data: { } }.merge( additional )

    role             = options[:role]
    icon             = options[:icon]
    klass            = options[:klass]
    is_remote        = options[:remote]
    additional_klass = options[:additional_klass]
    html_data        = options[:data]

    data_params = html_data.merge( { toggle: 'tooltip', placement: 'top', 'row-id': row_id, 'original-title': message } )
    data_params[:confirm] = I18n.t('confirmation') if options[:confirm]

    if path.present?
      link_to path, remote: is_remote, data: data_params, target: options[:target], method: role do
        concat( command_button_item( klass, additional_klass, icon, data_params ) )
      end

    else
      command_button_item( klass, additional_klass, icon, data_params )
    end
  end

  def command_button_item( klass, additional_klass, icon, data )
    button_tag( role: 'button', type: 'button', class: "btn btn-primary #{ klass } #{ additional_klass }", data: data ) do
      content_tag( :span, '', class: icon )
    end
  end

  def show_button( path, row_id, message, additional = { } )
    options = { role: :get, icon: 'zmdi zmdi-search' }.merge( additional )
    command_button( path, row_id, I18n.t('simple_form.show', message: message), options )
  end

  def open_filter_button
     button_tag( t('simple_form.filter'), id: 'enable-filter',
                 class: 'btn btn-regular pull-left' )
  end

  def do_filter_button
     button_tag( t('simple_form.search'), id: 'enable-filter',
                 class: 'btn btn-primary pull-right' )
  end

  def filter_form(path)
    content_tag(:div, class: 'col-sm-12 p-0') do
      concat(open_filter_button)

      concat(form_tag( path, method: :get, class: 'hidden', id: 'filter-form' ) do
        content_tag(:div, class: 'col-sm-12') do
          yield
        end
      end)

      concat(content_tag(:div, do_filter_button, class: 'col-sm-12'))
    end
  end
end
