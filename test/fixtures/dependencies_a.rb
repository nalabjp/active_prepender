module A
  module A
    def ins_meth_1
      :ins_meth_1_a
    end

    module ClassMethods
      def cls_meth_1
        :cls_meth_1_a
      end
    end
  end

  module B
    def ins_meth_2
      :ins_meth_2_b
    end

    module ClassMethods
      def cls_meth_2
        :cls_meth_2_b
      end
    end
  end

  module C
    def ins_meth_3
      :ins_meth_3_c
    end
  end

  module D
    extend ActivePrepender
    include A
    include B
    include C

    def ins_meth_4
      :ins_meth_4_d
    end

    module ClassMethods
      def cls_meth_4
        :cls_meth_4_d
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

    def ins_meth_4
      :ins_meth_4_e
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

      def cls_meth_4
        :cls_meth_4_e
      end
    end
  end

  module F
    extend ActivePrepender::WithInclude
    include A
    include B
    include C

    def ins_meth_4
      :ins_meth_4_f
    end

    module ClassMethods
      def cls_meth_4
        :cls_meth_4_f
      end
    end
  end

  module G
    include F
  end

  class H
    prepend G

    def ins_meth_1
      :ins_meth_1_h
    end

    def ins_meth_2
      :ins_meth_2_h
    end

    def ins_meth_3
      :ins_meth_3_h
    end

    def ins_meth_4
      :ins_meth_4_h
    end

    class << self
      def cls_meth_1
        :cls_meth_1_h
      end

      def cls_meth_2
        :cls_meth_2_h
      end

      def cls_meth_3
        :cls_meth_3_h
      end

      def cls_meth_4
        :cls_meth_4_h
      end
    end
  end
end
