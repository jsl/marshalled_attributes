require File.expand_path(File.join(File.dirname(__FILE__), %w[lib marshalled_attributes]))

ActiveRecord::Base.send(:include, MarshalledAttributes)
