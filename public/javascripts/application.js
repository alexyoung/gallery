// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var EditorGenerator = Class.create({
  initialize: function(class_name, url_base, error_message) {
    this.item_selector = '.' + class_name
    this.update_url = '/' + url_base + '/update/'
    this.error_message = error_message
    this.field = class_name.replace(/in_place_/, '')
    this.create_editors()
  },
  
  create_editors: function() {
    $$(this.item_selector).each(function(element)
    {
      var item_id = element.id.match(/_(\d+)$/)[1]
      this.create_editor(element, item_id)
    }.bind(this))
  },
  
  create_editor: function(element, item_id) {
    new Ajax.InPlaceEditor(element, this.update_url + item_id + '?field=' + this.field, {
      onFailure: this.onFailure.bind(this),
      callback: function(form, value) { return 'photo[' + this.field + ']=' + escape(value) }.bind(this)
    })
  },
  
  onFailure: function(editor, transport) {
    alert(this.error_message + ': ' + transport.responseText)
  }
})

document.observe('dom:loaded', function() {
  var title_generator = new EditorGenerator('in_place_title', 'photos', 'Error saving photo')
  var description_generator = new EditorGenerator('in_place_description', 'photos', 'Error saving photo')
})