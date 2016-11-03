require 'test_helper'
class ActivePrependerTest < Test::Unit::TestCase
  sub_test_case 'ActivePrepender' do
    test 'Simple usecase' do
      assert_equal 'my_instance_method_in_e_with_a_with_b_with_c_with_d', A::E.new.my_instance_method
      assert_equal 'my_class_method_in_e_with_a_with_b_with_d', A::E.my_class_method
    end
  end

  sub_test_case 'ActivePrepender::WithInclude' do
    test 'without ActiveSupport::Concern' do
      assert_equal 'my_instance_method_in_h_with_a_with_b_with_c_with_f', A::H.new.my_instance_method
      assert_equal 'my_class_method_in_h_with_a_with_b_with_f', A::H.my_class_method
    end

    test 'with ActiveSupport::Concern' do
      assert_equal 'my_instance_method_in_e_with_a_with_b_with_c_with_d', B::E.new.my_instance_method
      assert_equal 'my_class_method_in_e_with_a_with_b_with_c_with_d', B::E.my_class_method
    end
  end
end
