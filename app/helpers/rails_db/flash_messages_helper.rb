module RailsDb
  module FlashMessagesHelper
    # <div class="alert-box [success alert secondary]">
    #   This is an alert box.
    #   <a href="" class="close">&times;</a>
    # </div>
    DEFAULT_KEY_MATCHING = {
      :alert     => :alert,
      :notice    => :success,
      :info      => :info,
      :secondary => :secondary,
      :success   => :success,
      :error     => :alert,
      :warning   => :warning
    }
    def display_flash_messages(key_matching = {})
      key_matching = DEFAULT_KEY_MATCHING.merge(key_matching)
      key_matching.default = :standard

      result = capture do
        flash.each do |key, value|
          alert_class = key_matching[key.to_sym]
          concat alert_box(value, alert_class)
        end
      end
      flash.clear
      result
    end

  private

    def alert_box(value, alert_class)
      content_tag :div, data: { alert: '' }, class: "alert-box #{alert_class}" do
        concat value
        concat close_link
      end
    end

    def close_link
      link_to("&times;".html_safe, '#', class: :close)
    end

  end
end