# frozen_string_literal: true

# devise helper
module DeviseHelper
  def devise_error_messages!
    return if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg|
      content_tag(:p, "- #{msg}.")
    }.join
    sentence = I18n.t("errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
      <div class="bg-red-100 border-l-4 border-red-500 mb-4 p-4 text-red-700" role="alert">
          <p class="font-bold">Oops!</p>
          <p>#{sentence}</p>#{messages}
      </div>
    HTML

    html.html_safe
  end

  def devise_simple_error_messages!
    return if resource.errors.empty?

    sentence = "Ooops!"
    if resource.errors.count == 1
      message =  resource.errors.full_messages[0]
      html = <<-HTML
        <div class="bg-red-lightest border-l-4 border-red text-orange-dark p-4" role="alert">
          <p class="font-bold">#{sentence}</p>
          <p> #{ message }.</p>
        </div>
      HTML
    else
      messages = resource.errors.full_messages.map { |msg|
        content_tag(:li, "#{msg}.")
      }.join
      html = <<-HTML
        <div class="bg-red-100 border-l-4 border-red-500  mb-4 p-4 text-red-700" role="alert">
          <p class="font-bold">#{sentence}</p>
          <ul class="list-disc">
            #{messages}
          </ul>
        </div>
      HTML
    end

    html.html_safe
  end

  def devise_urls
    if user_signed_in?
      link_to t('sign_out'), destroy_user_session_url, method: :delete, class: "block py-2 pr-4 pl-3 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent"
    else
      link_to t('login'), sign_in_url, method: :get, class: "block py-2 pr-4 pl-3 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent"
    end
  end
end
