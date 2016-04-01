module ActiveRecord

  class Relation
    include OtherJoinsMethods
  end

  module Querying
    delegate :left_join, :left_joins, to: :all
  end

end
