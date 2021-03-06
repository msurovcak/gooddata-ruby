# encoding: UTF-8

require 'logger'

require_relative 'base_middleware'

module GoodData
  module Bricks
    class LoggerMiddleware < Bricks::Middleware
      def call(params)
        logger = params['GDC_LOGGER'] = params[:GDC_LOGGER_FILE].nil? ? Logger.new(STDOUT) : Logger.new(params[:GDC_LOGGER_FILE])
        logger.info('Pipeline starts')
        returning(@app.call(params)) do |result|
          logger.info('Pipeline ending')
        end
      end
    end
  end
end
