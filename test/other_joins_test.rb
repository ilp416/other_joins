require 'test_helper'

class OtherJoinsTest < MiniTest::Test
  def test_that_it_has_a_version_number
    refute_nil ::OtherJoins::VERSION
  end

  def test_AR_relation_has_left_joins_method
    assert User.where(nil).methods.include?(:left_joins),
      'Relation haven\'t method left_joins'
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
