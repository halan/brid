# Brid


## Installation

Add this line to your application's Gemfile:

    gem 'brid'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install brid

## Components

* CPF object with validation (brazilian document)
* CNPJ object with validation (brazilian document)
* Título de Eleitor object with validation (brazilian document)
* PIS object with validation (brazilian document)
* Cred Card object with validation (generic)
* Generic ID validation (can validate bank account and other things)

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

### Validating a Cred Card

``` ruby
CredCard.new('30111198763335').valid? # true
(Mod10.new('3011119876333') * 1).to_s == '30111198763335' # true
```


### Next Steps

* Develop a rails plugin built on top of ActiveRecord
* Develop a smart generator for fixture on tests (I thought of doing built on top of ffaker, like my othre gem: [ffaker-cpfcnpj](https://github.com/halan/ffaker-cpfcnpj) )

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
