# Brid


## Installation

Add this line to your application's Gemfile:

    gem 'brid'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install brid

## Usage

### Validating a CPF

``` ruby
CPF.new('135246876-01').valid?   # true
CPF.new('135.246.876-01').valid? # true
CPF.new('13524687601').valid?    # true
CPF.new(13524687601).valid?      # true
(Mod11.new('135246876') * 2).to_s == '13524687601' # true
```

### Validating a CNPJ

``` ruby
CNPJ.new('18.781.203/0001-28').valid? # true
(Mod11.new('8.781.203/0001', :base => 2..9) * 2).to_s == '8781203000128' # true
``` 
  
### Validating a Bank Account

``` ruby
GenericID.new('12345-5').valid? # true
(Mod11.new('12345') * 1).to_s == '123455' # true
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
