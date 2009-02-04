# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def in_place_editor_if(condition, object, field, &block)
    if condition
      object_id = "#{object.class.name.downcase}_#{field}_#{object.id}"
      in_place_class = "in_place_#{field}"
      
      concat '<span id="%s" class="%s">' % [object_id, in_place_class], block.binding
      yield
      concat '</span>', block.binding
    else
      yield
    end
  end
end
