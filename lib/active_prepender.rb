require "active_prepender/version"

module ActivePrepender
  def append_features(base)
    ret = super

    return ret if ret == false
    return if @_dependencies.nil?

    cmethod_dependencies = @_dependencies.map { |dep| dep.const_get(:ClassMethods) rescue nil }.compact
    base.instance_variable_set(:@_cmethod_dependencies, cmethod_dependencies)

    base.singleton_class.prepend(Module.new {
      def prepended(kls)
        super
        @_cmethod_dependencies.each { |dep| kls.singleton_class.prepend(dep) }
      end
    })
  end
end
