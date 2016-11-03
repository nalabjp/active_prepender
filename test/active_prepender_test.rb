require 'test_helper'
class ActivePrependerTest < Test::Unit::TestCase
  sub_test_case 'ActivePrepender' do
    test 'Simple usecase' do
      assert_equal :ins_meth_1_a, A::E.new.ins_meth_1
      assert_equal :ins_meth_2_b, A::E.new.ins_meth_2
      assert_equal :ins_meth_3_c, A::E.new.ins_meth_3
      assert_equal :ins_meth_4_d, A::E.new.ins_meth_4
      assert_equal :cls_meth_1_a, A::E.cls_meth_1
      assert_equal :cls_meth_2_b, A::E.cls_meth_2
      assert_equal :cls_meth_3_e, A::E.cls_meth_3
      assert_equal :cls_meth_4_d, A::E.cls_meth_4
    end
  end

  sub_test_case 'ActivePrepender::WithInclude' do
    test 'without ActiveSupport::Concern' do
      assert_equal :ins_meth_1_a, A::H.new.ins_meth_1
      assert_equal :ins_meth_2_b, A::H.new.ins_meth_2
      assert_equal :ins_meth_3_c, A::H.new.ins_meth_3
      assert_equal :ins_meth_4_f, A::H.new.ins_meth_4
      assert_equal :cls_meth_1_a, A::H.cls_meth_1
      assert_equal :cls_meth_2_b, A::H.cls_meth_2
      assert_equal :cls_meth_3_h, A::H.cls_meth_3
      assert_equal :cls_meth_4_f, A::H.cls_meth_4
    end

    test 'with ActiveSupport::Concern' do
      assert_equal :ins_meth_1_a, B::E.new.ins_meth_1
      assert_equal :ins_meth_2_b, B::E.new.ins_meth_2
      assert_equal :ins_meth_3_c, B::E.new.ins_meth_3
      assert_equal :ins_meth_4_d, B::E.new.ins_meth_4
      assert_equal :cls_meth_1_a, B::E.cls_meth_1
      assert_equal :cls_meth_2_b, B::E.cls_meth_2
      assert_equal :cls_meth_3_c, B::E.cls_meth_3
      assert_equal :cls_meth_4_d, B::E.cls_meth_4
    end
  end
end
