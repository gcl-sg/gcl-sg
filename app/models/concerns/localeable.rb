module Localeable
  extend ActiveSupport::Concern

  included do

  end

  module ClassMethods
    def localeable(*args)
      args.each do |arg|
        next unless arg.is_a?(String) || arg.is_a?(Symbol)
        define_method(arg) do
          case I18n.locale
            when :'zh-CN'
              self.send(:"#{arg}_zh_cn")
            when :'zh-TW'
              self.send(:"#{arg}_zh_tw")
            when :en
              self.send(:"#{arg}_en")
            else
              self.send(:"#{arg}_zh_cn")
          end
        end
      end
    end
  end

end