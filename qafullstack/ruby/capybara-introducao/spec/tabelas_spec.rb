#Aula: Verificando dados em tabelas

describe 'Tabelas', :tabs, :smoke do

    before(:each)do
        visit '/tables'
    end

    it 'deve exibir o salário do stark' do
        atores = all('table tbody tr')
        stark = atores.detect { |ator|ator.text.include?('Robert Downey Jr') }
        expect(stark.text).to include ' 10.000.000'
    end

    it 'deve exibir o salario do vin diesel' do 
        diesel = find('table tbody tr', text: '@vindiesel') #busca por um valor chave na tabela
        expect(diesel).to have_content ' 10.000.000'
    end

    it 'deve exibir o filme velozes' do
        diesel = find('table tbody tr', text: '@vindiesel')
        movie = diesel.all('td')[2].text #estou pegando o texto da posição 2 do array
        expect(movie).to eql 'Fast & Furious'
    end
    
    it 'deve exibir o insta do Chris Evans' do
        evans = find('table tbody tr', text: 'Chris Evans')
        insta = evans.all('td')[4].text
        expect(insta).to eql '@teamcevans'
    end

    it 'deve selecionar o Chris Pratt para remocao' do
        pratt = find('table tbody tr', text: 'Chris Pratt')
        pratt.find('a', text: 'delete').click
        msg = page.driver.browser.switch_to.alert.text
        
        expect(msg).to eql 'Chris Pratt foi selecionado para remoção!'
    end

    it 'deve selecionar o Chris Pratt para edicao' do
        pratt = find('table tbody tr', text: 'Chris Pratt')
        pratt.find('a', text: 'edit').click
        msg = page.driver.browser.switch_to.alert.text
        
        expect(msg).to eql 'Chris Pratt foi selecionado para edição!'
    end

end