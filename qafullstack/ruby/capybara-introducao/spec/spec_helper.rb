require 'capybara'
require 'capybara/rspec'

RSpec.configure do |config|  
  config.expect_with :rspec do |expectations|
  expectations.include_chain_clauses_in_custom_matcher_descriptions = true
end

config.mock_with :rspec do |mocks|
  mocks.verify_partial_doubles = true
end
  config.shared_context_metadata_behavior = :apply_to_host_groups
  
  config.include Capybara::DSL

  config.before(:example)do #Redimensionando Janela do Navegador
    page.current_window.resize_to(1280, 800)
  end

  config.after(:example) do |e|
    nome = e.description.gsub(/[^A-Za-z0-9 ]/, '').tr(' ', '_') #trata os caracteres especiais no nome do arquivo e substitui os espacos por _
    # if e.exception condição para obter evidência somente quando o teste falha
    # para todos os cenários tire o if
    page.save_screenshot('log/' + nome + '.png') #if e.exception 
  
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome_headless #Rodar com o Chrome, com modulo headless o navegador nao fica visivel
  #config.default_driver = :selenium #Rodar com Firefox
  config.default_max_wait_time = 5 #confiracao do tempo que o capybara tem para encontrar um elemento
  config.app_host = 'https://training-wheels-protocol.herokuapp.com'
end
