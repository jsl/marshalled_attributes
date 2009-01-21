module MarshalledAttributes

  def self.included(base)
    base.extend(SingletonMethods)
  end

  module SingletonMethods

    def marshalled_attribute(*args)
      args.each do |arg|
        define_method arg do
          Marshal.load(self[arg])
        end

        define_method "#{arg}=" do |value|
          self[arg] = Marshal.dump(value)
        end
      end
    end
  end
end