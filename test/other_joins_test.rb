require 'test_helper'


case ActiveRecord::OTHER_JOINS_WAY
when 3, 4.0
  class OtherJoinsTest < MiniTest::Unit::TestCase
  end
when 4.1
  class OtherJoinsTest < MiniTest::Test
  end
end

class OtherJoinsTest
  def test_that_it_has_a_version_number
    refute_nil ::OtherJoins::VERSION
  end

  def test_AR_relation_has_left_joins_method
    assert User.methods.include?(:left_joins),
      'Relation haven\'t method left_joins'
  end

  def test_AR_relation_has_left_join_method
    assert User.methods.include?(:outer_joins),
      'Relation haven\'t method outer_joins'
  end

  def test_generating_left_outer_join_sql
    orig_sql = User.joins("LEFT OUTER JOIN \"orders\" ON \"orders\".\"user_id\" = \"users\".\"id\"").to_sql
    other_joins_sql = User.left_joins(:orders).to_sql
    assert_equal orig_sql, other_joins_sql
  end

  def test_generating_nested_left_outer_join_sql
    orig_sql = User.joins("LEFT OUTER JOIN \"orders\" ON \"orders\".\"user_id\" = \"users\".\"id\" LEFT OUTER JOIN \"shops\" ON \"shops\".\"id\" = \"orders\".\"shop_id\"").to_sql
    other_joins_sql = User.left_joins(orders: :shop).to_sql
    assert_equal orig_sql, other_joins_sql
  end

end
