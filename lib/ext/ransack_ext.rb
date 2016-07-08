module Ransack
  module Helpers
    module FormHelper

      class SortLink

        def url_options_with_feature
          result = url_options_without_feature
          return result.permit! if result.respond_to?(:permit!)
          result
        end

        alias_method :url_options_without_feature, :url_options
        alias_method :url_options, :url_options_with_feature
      end

    end
  end
end
