module B
  module A
    extend ActiveSupport::Concern

    def my_instance_method
      "#{super}_with_a"
    end

    class_methods do
      def my_class_method
        "#{super}_with_a"
      end
    end
  end

  module B
    extend ActiveSupport::Concern

    def my_instance_method
      "#{super}_with_b"
    end

    class_methods do
      def my_class_method
        "#{super}_with_b"
      end
    end
  end

  module C
    extend ActiveSupport::Concern
    extend ActivePrepender::WithInclude
    include A
    include B

    def my_instance_method
      "#{super}_with_c"
    end

    class_methods do
      def my_class_method
        "#{super}_with_c"
      end
    end
  end

  module D
    include C

    def my_instance_method
      "#{super}_with_d"
    end

    module ClassMethods
      def my_class_method
        "#{super}_with_d"
      end
    end
  end

  class E
    prepend D

    def my_instance_method
      'my_instance_method_in_e'
    end

    class << self
      def my_class_method
        'my_class_method_in_e'
      end
    end
  end
end
