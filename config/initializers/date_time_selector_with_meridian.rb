module ActionView
  module Helpers
    class DateTimeSelector
      def select_hour_with_meridian
        if @options[:meridian]
          if @options[:use_hidden] || @options[:discard_hour]
            build_hidden(:hour, hour)
          else
            html = build_options_and_select(:hour, hour, end: 23)
            html.to_param.gsub />(\d+)</ do |match|
              h = $1.to_i
              case h
              when 0
                '>12 AM<'
              when 1 .. 11
                ">#{h} AM<"
              when 12
                '>12 PM<'
              when 13 .. 23
                ">#{h - 12} PM<"
              else
                '>??<'
              end
            end.html_safe
          end
        else
          select_hour_without_meridian
        end
      end
      alias_method_chain :select_hour, :meridian
    end
  end
end
