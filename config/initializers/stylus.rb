if defined? Stylus
  Stylus.use :nib

  if defined? Slim
    module Slim
      class EmbeddedEngine
        register :styl,
          TagEngine, tag: :style, attributes: { type: 'text/css' },
          engine: StaticTiltEngine
      end
    end
  end
end