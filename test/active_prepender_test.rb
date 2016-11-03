require 'test_helper'
class ActivePrependerTest < Test::Unit::TestCase
  sub_test_case 'ActivePrepender' do
    test 'methods' do
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

  sub_test_case 'ActivePrepender::WithConcern' do
    test 'methods' do
      assert_equal :ins_meth_1_a, B::E.new.ins_meth_1
      assert_equal :ins_meth_2_b, B::E.new.ins_meth_2
      assert_equal :ins_meth_3_d, B::E.new.ins_meth_3
      assert_equal :cls_meth_1_a, B::E.cls_meth_1
      assert_equal :cls_meth_2_b, B::E.cls_meth_2
      assert_equal :cls_meth_3_d, B::E.cls_meth_3
    end
  end
end