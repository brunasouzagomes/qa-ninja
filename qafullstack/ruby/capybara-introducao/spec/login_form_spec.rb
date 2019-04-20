
describe 'Forms', :smoke do
    it 'login com sucesso' do
        visit '/login'
        fill_in 'userId', with: 'stark' #preencho o campo usuário
        fill_in 'password', with: 'jarvis!' #preencho o campo senha
        click_button 'Login' #clico no botão login
        #expect(find('#flash').visible?).to be true #verifico se o elemento é visivel na tela
        
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!' #verifico se dentro do elemento contém a mensagem
        
    end

    it 'senha incorreta' do
        visit '/login'
        fill_in 'userId', with: 'stark' 
        fill_in 'password', with: 'teste1' 
        click_button 'Login'
        expect(find('#flash')).to have_content 'Senha é invalida!'
        
    end

    it 'usuário não cadastrado' do
        visit '/login'
        fill_in 'userId', with: 'teste' 
        fill_in 'password', with: 'jarvis!' 
        click_button 'Login'
        expect(find('#flash')).to have_content 'O usuário informado não está cadastrado!'
        
    
    end
end
