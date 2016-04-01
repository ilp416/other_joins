$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'other_joins'

require 'minitest/autorun'
require "active_record"

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", 
                                       :database => ":memory:")
class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop
end
class Shop < ActiveRecord::Base
  has_many :orders
end
class User < ActiveRecord::Base
  has_many :orders
end

# migrations
ActiveRecord::Migration.verbose = false

ActiveRecord::Migration.create_table :users, force: true do |t|
  t.string :name
  t.string :email
  t.timestamps null: false
end

ActiveRecord::Migration.create_table :orders, force: true do |t|
  t.integer :user_id
  t.integer :shop_id
  t.string :title
  t.timestamps null: false
end

ActiveRecord::Migration.create_table :shops, force: true do |t|
  t.string :title
  t.timestamps null: false
end
