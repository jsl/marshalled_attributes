require 'rubygems'
require 'activerecord'
require 'ostruct'

require File.join(File.dirname(__FILE__), %w[.. init])

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :dbfile => ":memory:"
)

ActiveRecord::Migration.verbose = false

ActiveRecord::Base.silence do
  ActiveRecord::Schema.define do
    create_table :tacos do |table|
      table.binary :salsa
    end
  end
end

class Taco < ActiveRecord::Base
  marshalled_attribute :salsa
end

describe MarshalledAttributes do
  before do
    @taco = Taco.new(:salsa => ['beans', 'tomatillos'])
  end

  it "should retrieve an Array object" do
    @taco.salsa.should be_an_instance_of(Array)
  end

  it "should contain beans and tomatillos" do
    @taco.salsa.should == %w[beans tomatillos]
  end
end
