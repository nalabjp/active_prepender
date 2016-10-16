require 'test_helper'
class ActivePrependerTest < Test::Unit::TestCase
  test 'methods' do
    assert_equal :ins_meth_1_a, E.new.ins_meth_1
    assert_equal :ins_meth_2_b, E.new.ins_meth_2
    assert_equal :ins_meth_3_d, E.new.ins_meth_3
    assert_equal :cls_meth_1_a, E.cls_meth_1
    assert_equal :cls_meth_2_b, E.cls_meth_2
    assert_equal :cls_meth_3_d, E.cls_meth_3
  end
end
