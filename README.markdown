MarshalledAttributes
====================

MarshalledAttributes allows you to marshal data to attributes in your
ActiveRecord database, instead of the default YAML serialization supported by
Rails.

Usage
-----

Create the attributes that you want to use in a migration as binary columns.

For example,

    create_table :tacos do |table|
        table.binary :salsa
    end

Then, in the ActiveRecord::Base class, just do:

`marshal :salsa`

You can then put ruby objects which will be Marshal loaded and dumped automatically
into your table.
