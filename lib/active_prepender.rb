require "active_prepender/version"

module ActivePrepender
  module Prependable
    def prepend_features(base)
      super

      included_modules.reverse.push(self).each do |mod|
        base.singleton_class.prepend(mod.const_get(:ClassMethods)) if mod.const_defined?(:ClassMethods)
      end
    end
  end

  include Prependable

  module WithInclude
    def append_features(base)
      return false if super == false

      base.extend(Prependable)
    end
  end
end
