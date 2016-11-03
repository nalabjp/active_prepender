module B
  module A
    extend ActiveSupport::Concern

    def ins_meth_1
      :ins_meth_1_a
    end

    class_methods do
      def cls_meth_1
        :cls_meth_1_a
      end
    end
  end

  module B
    extend ActiveSupport::Concern

    def ins_meth_2
      :ins_meth_2_b
    end

    class_methods do
      def cls_meth_2
        :cls_meth_2_b
      end
    end
  end

  module C
    extend ActiveSupport::Concern
    extend ActivePrepender::WithConcern
    include A
    include B
  end

  module D
    include C

    def ins_meth_3
      :ins_meth_3_d
    end

    module ClassMethods
      def cls_meth_3
        :cls_meth_3_d
      end
    end
  end

  class E
    prepend D

    def ins_meth_1
      :ins_meth_1_e
    end

    def ins_meth_2
      :ins_meth_2_e
    end

    def ins_meth_3
      :ins_meth_3_e
    end

    class << self
      def cls_meth_1
        :cls_meth_1_e
      end

      def cls_meth_2
        :cls_meth_2_e
      end

      def cls_meth_3
        :cls_meth_3_e
      end
    end
  end
end
