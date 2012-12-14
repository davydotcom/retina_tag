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

        if options[:lazy]
          options.delete(:lazy)
          options["data-lazy-load"] = "1x"
          options[:lowdpi_src] = source
          source = ''
        end
        image_tag_without_retina(source,options_default.merge(options))
      end

      alias_method_chain :image_tag, :retina
    end
  end
end
