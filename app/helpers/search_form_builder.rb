class SearchFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(method, tag_value, options = {})
    # in here you could build any html you want. 
    # You should be able to call your view component for input fields 
    # for example: KhigaDesingSystem::TextField(params)
  end
end
