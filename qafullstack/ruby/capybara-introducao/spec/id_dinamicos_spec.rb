#Aula: Buscando IDs Dinâmicos com Regex

describe 'IDs Dinâmicos', :ids_dinamicos do
    before(:each) do
        visit '/access'
    end
#CSS Selector:
    # $ => termina com
    # ^ => começa com 
    # * => contém

    it 'cadastro' do
        find('input[id$=UsernameInput]').set 'Bruna'
        find('input[id^=PasswordInput]').set '123'
        find('a[id*=GetStartedButton]').click

        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    
    end


end