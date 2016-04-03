module ActiveRecord

  class InvalidActiveRecordVersion < StandardError
  end

  OTHER_JOINS_WAY = 
    case
    when ActiveRecord::VERSION::STRING =~ /^3/
      3
    when ActiveRecord::VERSION::STRING =~ /^4.0/
      4.0
    when ActiveRecord::VERSION::STRING =~ /^4.[1,2]/
      4.1
    else
      raise InvalidActiveRecordVersion, "Gem 'other_joins #{OtherJoins::VERSION}' cannot work with 'activerecord #{ActiveRecord.version}'"
    end
end
