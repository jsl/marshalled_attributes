Marshalled Attributes
====================

MarshalledAttributes allows you to marshal data to attributes in your
ActiveRecord database, instead of the default YAML serialization supported by
Rails.

Reasons that you may want to do this include the fact that Marshal serialization
is faster than YAML serialization, and because Ruby serialization using Marshal
allows a wider range of objects to be serialized than by using YAML serialization.

Usage
-----

Install the plugin in your Rails app with:

    ./script/plugin install git://github.com/jsl/marshalled_attributes.git

Then, create the attributes in your migration as binary columns.

For example,

    create_table :tacos do |table|
        table.binary :salsa
        table.binary :guacamole
    end

Finally, in the ActiveRecord::Base class, use the same syntax that you would
have with the Rails YAML serialization scheme, replacing ':serialize with ':marshal':

    marshal :salsa, :guacamole

The attributes :salsa and :guacamole will be automatically Marshal loaded and
dumped as needed, allowing you to store Arrays and other Marshal-serializable
objects in your database.

For example:

    Taco.create!(:salsa => [ 'tomatoes', 'onions' ], :guacamole => [ 'avocado', 'jalapeno' ])


Performance
-----------

According to one benchmark, [YAML is approximately 35 times slower at
serialization and 6 times slower at deserialization than Marshal][1].
Benchmarks using this plugin compared to Rails' native serialization using YAML
have not yet been performed.

Credits
-------

Thanks to Geoff Ereth for giving me the idea to write this plugin.

[1]: http://significantbits.wordpress.com/2008/01/29/yaml-vs-marshal-performance/