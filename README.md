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

## License

Copyright (c) 2012 Halan Pinheiro

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
