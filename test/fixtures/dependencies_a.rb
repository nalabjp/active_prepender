module A
  module A
    def my_instance_method
      "#{super}_with_a"
    end

    module ClassMethods
      def my_class_method
        "#{super}_with_a"
      end
    end
  end

  module B
    def my_instance_method
      "#{super}_with_b"
    end

    module ClassMethods
      def my_class_method
        "#{super}_with_b"
      end
    end
  end

  module C
    def my_instance_method
      "#{super}_with_c"
    end
  end

  module D
    extend ActivePrepender
    include A
    include B
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

  module F
    extend ActivePrepender::WithInclude
    include A
    include B
    include C

    def my_instance_method
      "#{super}_with_f"
    end

    module ClassMethods
      def my_class_method
        "#{super}_with_f"
      end
    end
  end

  module G
    include F
  end

  class H
    prepend G

    def my_instance_method
      'my_instance_method_in_h'
    end

    class << self
      def my_class_method
        'my_class_method_in_h'
      end
    end
  end
end
