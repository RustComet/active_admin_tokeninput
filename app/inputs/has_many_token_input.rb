class HasManyTokenInput < Formtastic::Inputs::StringInput

	def input_html_options
		search_property = options[:search_property] || "name"
		super.merge(
			"class" => "active-admin-tokeninput",
			"data-field-name" => "#{object_name.underscore}[#{method.to_s.singularize}_ids][]",
			"data-pre" => object.send("#{method}").map.to_json(:only => [:id, search_property.to_sym]),
			"name" => "",
			"value" => "",
			"data-autocomplete-path" => options[:autocomplete_path] ||= Rails.application.routes.url_helpers.send("autocomplete_admin_#{method.to_s}_path"),
			"data-property-to-search" => search_property
			)
	end
end
