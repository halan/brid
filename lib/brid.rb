#requires

root_dir = File.join(File.dirname(__FILE__), 'brid')

require File.join(root_dir, 'version.rb')

#mod algorithms
[
  'luhn.rb',
  'mod10.rb',
  'mod11.rb'
].each do |filename|
  require File.join(root_dir, 'algorithms', filename)
end

#ids and documents
[
  'generic_id',
  'cpf.rb',
  'cnpj.rb',
  'titulo_eleitor.rb',
  'pis.rb',
  'cred_card.rb'
].each do |filename|
  require File.join(root_dir, 'ids', filename)
end

require File.join(File.dirname(__FILE__), 'brid', 'detector.rb')

