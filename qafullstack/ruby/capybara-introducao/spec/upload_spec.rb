
describe 'Upload', :upload do

    before(:each) do #comando Dir.pwd pega o diretorio que esta sendo feita a execucao do meu projeto
        visit '/upload'
        @arquivo = Dir.pwd + '/spec/fixtures/arquivo.txt'
        @imagem = Dir.pwd + '/spec/fixtures/groot.jpg'
        
    end

    it 'upload com arquivo texto' do
        attach_file('file-upload', @arquivo)
        click_button 'Upload'
        
        div_arquivo = find('#uploaded-file')
        expect(div_arquivo.text).to eql 'arquivo.txt'
    end

    it 'upload de imagem', :upload_imagem do
        attach_file('file-upload', @imagem)
        click_button 'Upload'
        
        img = find('#new-image')
        expect(img[:src]).to include '/uploads/groot.jpg'
    end





    after(:each) do
        sleep 3
    end
end