#Aula: Trabalhando com escopos com capybara

describe 'Login com Cadastro', :login3 do

    before(:each) do
        visit '/access'
    end

    it 'login com sucesso' do
        
        within('#login') do
            find('input[name=username]').set 'stark'
            find('input[name=password]').set 'jarvis!'
            click_button 'Entrar'
        end
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!' 
    end

    it 'cadastro com sucesso'do

        within('#signup') do
            find('input[name=username]').set 'bruna'
            find('input[name=password]').set 'teste'
            click_link 'Criar Conta'
        end
        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    end

end
