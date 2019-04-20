

describe 'Caixa de Opções', :dropdown do #coloco uma tag para que somente essa suite seja executada
    
    
    it 'item especifico simples' do #busca pelo id do elemento
        visit '/dropdown'
        select('Loki', from: 'dropdown')
        sleep 3 #temporario
    end

    it 'item especifico com o find' do #busca pela classe do elemento
        visit '/dropdown'
        drop = find('.avenger-list')
        drop.find('option', text: 'Scott Lang').select_option #procura um elemento que tenha o texto e seleciona a opção
        sleep 3 #temporario
    end

    it 'qualquer item', :sample do
        visit '/dropdown'
        drop = find('.avenger-list')
        drop.all('option').sample.select_option #metodo sample(dentro de um array, selecione um elemento qualquer)
        sleep 3 #temporario
    end
end