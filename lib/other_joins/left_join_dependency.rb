module ActiveRecord
  module Associations
    class LeftJoinDependency < JoinDependency

      protected
      def build(associations, base_klass)
        super
      end

    end
  end
end
