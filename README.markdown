MarshalledAttributes
====================

MarshalledAttributes allows you to marshal data to attributes in your
ActiveRecord database, instead of the default YAML serialization supported by
Rails.

Reasons that you may want to do this include the fact that Marshal serialization
is faster than YAML serialization, and because Ruby serialization using Marshal
may allow a wider range of objects to be serialized than by using YAML
serialization.

Usage
-----

Install the plugin in your Rails app with:

    `./script/plugin install git://github.com/jsl/marshalled_attributes.git`

Then, create the attributes in your migration as binary columns.

For example,

    create_table :tacos do |table|
        table.binary :salsa
        table.binary :enchilada
    end

Finally, in the ActiveRecord::Base class, use the same syntax that you would
have with the Rails YAML serialization scheme, replacing :serialize with :marshal:

`marshal :salsa, :enchilada`

The attributes :salsa and :enchilada will be automatically Marshal loaded and
dumped as needed, allowing you to store Arrays and other Marshal-serializable
objects in your database.