module ActionView
  module Helpers
    module AssetTagHelper
      def hidpi_asset_path(path)
        begin
          retina_els = path.split('.')
          extension = retina_els.last
          retina_els.slice!(-1)
          retina_path = "#{retina_els.join('.')}@2x.#{extension}"

          if !Rails.application.assets.find_asset(retina_path).nil?
            asset_path(retina_path)
          end
        rescue
          nil
        end
      end

      def image_tag_with_retina(source,options={})
        options_default = { :hidpi_src => hidpi_asset_path(source) }

        if lazy = options.delete(:lazy)
          options["data-lazy-load"] = lazy
        end

        options_default.merge!(options)

        image_tag_without_retina(source,options_default)

        if options_default[:"data-lazy-load"]
          puts "Lazy load detected"
          options_default[:lowdpi_src] = options_default.delete(:src)
        end
        puts "Using custom image Tag!"
        puts options_default
        tag("img", options_default)
      end

      alias_method_chain :image_tag, :retina
    end
  end
end
