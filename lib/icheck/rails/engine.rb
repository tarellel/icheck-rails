require 'rails'

module Icheck
  module Rails
    ASSETS = {
      flat: %i(aero blue flat green grey orange pink purple red yellow).freeze,
      futurico: %i(futurico).freeze,
      line: %i(line).freeze,
      minimal: %i(aero blue green grey minimal orange pink purple red yellow).freeze,
      polaris: %i(polaris).freeze,
      square: %i(aero blue green grey orange pink purple red square yellow).freeze
    }.freeze


    class Engine < ::Rails::Engine
      initializer "icheck-rails.assets.precompile" do |app|
        icheck_assets = []
        ::Icheck::Rails::ASSETS.each do |skin, files|
          icheck_assets += files.map { |file| "icheck/#{skin}/#{file}.png" }
          icheck_assets += files.map { |file| "icheck/#{skin}/#{file}@2x.png" }
        end
        app.config.assets.precompile += icheck_assets
      end
    end
  end
end
