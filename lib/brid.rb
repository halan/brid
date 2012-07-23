['version.rb', 'mod.rb', 'mod10.rb', 'mod11.rb', 'generic_id.rb'].each do |filename|
  require File.join(File.dirname(__FILE__), 'brid', filename)
end

['cpf.rb', 'cnpj.rb', 'titulo_eleitor.rb', 'pis.rb', 'cred_card.rb'].each do |filename|
  require File.join(File.dirname(__FILE__), 'brid', 'ids', filename)
end


require File.join(File.dirname(__FILE__), 'brid', 'detector.rb')

