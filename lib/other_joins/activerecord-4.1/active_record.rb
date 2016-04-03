module ActiveRecord

  class Relation
    include OtherJoinsMethods
  end

  module Querying
    delegate :left_joins, :outer_joins, to: :all
  end

end
