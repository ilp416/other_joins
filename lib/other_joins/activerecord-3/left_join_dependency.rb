module ActiveRecord
  module Associations
    module ClassMethods
      class LeftJoinDependency < JoinDependency

        protected
        def build(associations, parent = nil, join_type = Arel::OuterJoin)
          super
        end

      end
    end
  end
end
