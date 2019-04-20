
describe 'Alertas de JS', :alerts do
    before(:each)do
        visit '/javascript_alerts'
    end

    it 'alerta' do
        click_button 'Alerta'
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Isto é uma mensagem de alerta'
    end

    it 'sim confirma' do
        click_button 'Confirma'
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'

        page.driver.browser.switch_to.alert.accept #metodo accept = confirmar
        expect(page).to have_content 'Mensagem confirmada'
    end

    it 'não confirma' do
        click_button 'Confirma'
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'

        page.driver.browser.switch_to.alert.dismiss #metodo dismiss = cancelar
        expect(page).to have_content 'Mensagem não confirmada'
    end

    it 'accept prompt', :accept_prompt do
        
        accept_prompt(with: 'Bruna') do #aceita o prompt com o nome Bruna
            click_button 'Prompt' #clica no botão com o nome Prompt
        end
        
        expect(page).to have_content 'Olá, Bruna' 

    end

    it 'dismiss prompt', :dismiss_prompt do
        
        dismiss_prompt(with: 'Bruna') do #aceita o prompt com o nome Bruna
            click_button 'Prompt' #clica no botão com o nome Prompt
        end
        
        expect(page).to have_content 'Olá, null' 

    end
end