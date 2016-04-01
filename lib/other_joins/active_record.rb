require 'active_support/core_ext/module'
module ActiveRecord

  class Relation
    include OtherJoinsMethods
  end

  class Base
    class << self # Class methods
      delegate :left_joins, :outer_joins, to: :scoped
    end
  end
end
