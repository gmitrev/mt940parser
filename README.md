# MT940Parser

A parser written in Treetop for handling files in MT940 format. The format is widely used in
Europe by banks and it contains information about client account statements for a given time period.

## Installation

Add this line to your application's Gemfile:

    gem 'mt940parser'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mt940parser

## Usage

    result = MT940::Parser.parse(string)
    
Now you can do some cool stuff like list all records:

    result.elements #=>
    
Or list all transactions for a given record:

    result.elements.first.transactions
    
More to come

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
