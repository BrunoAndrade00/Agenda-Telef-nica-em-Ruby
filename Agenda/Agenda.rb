# Adicionar, Editar e Remover Contato;
# Os contatos terão as seguintes informações: Nome e Telefone;
# Poderemos ver todos os contatos registrados ou somente um contato;

#\n serve para pular 1 linha (quebra de parágrafo)

# Criando a agenda
@agenda = [
    {nome:"Bruno", telefone:"123456789"},
    {nome:"Anita", telefone:"456789123"},
    {nome:"Suely", telefone:"789123456"},
    {nome:"Ribamar", telefone:"123789456"},
    {nome:"Gabrielle", telefone:"456789123"}
]

def todos_contatos 
    @agenda.each do |contato|
        puts " #{contato[:nome]} - #{contato[:telefone]} "
    end
    puts "####################"
end

def adicionar_contato
    print "Nome: "
    nome = gets.chomp
    print "Telefone: "
    telefone = gets.chomp
   
    @agenda << {nome: nome, telefone: telefone}
end

def ver_contato
    print "Qual contato você deseja localizar: "
    nome = gets.chomp 

    @agenda.each do |contato|
        if contato [:nome].downcase.include?(nome.downcase)
            puts " #{contato[:nome]} - #{contato[:telefone]}" 
        end
    end
    puts "####################"
end

def editar_contato
    print "Qual nome deseja editar: "
    nome = gets.chomp
     
    @agenda.each do |contato|
        if contato [:nome].downcase.include?(nome.downcase)
            print " Nome para editar (se quiser manter o mesmo nome, aperte ENTER):  "
            nome_salvo = contato[:nome]

            contato[:nome] = gets.chomp 
            contato[:nome] = contato[:nome].empty? ? nome_salvo : contato[:nome]
            
            print " Telefone para editar (se quiser manter o mesmo telefone, aperte ENTER):  "
            telefone_salvo = contato[:telefone]

            contato[:telefone] = gets.chomp 
            contato[:telefone] = contato[:telefone].empty? ? telefone_salvo : contato[:telefone]
        end
    end
end

def remover_contato
    print "Qual contato deseja remover: "
    nome = gets.chomp 

    @agenda.each do |contato|
        if contato [:nome].downcase.include?(nome.downcase)
            # pra mostrar a posição do contato na agenda
            indice = @agenda.index(contato)
            @agenda.delete_at(indice)
            break
        end   
    end
end

loop do 

puts "1. Seus contatos\n2. Adicionar Contato\n3. Ver Contato\n4. Editar Contato\n5. Remover Contato\n0. Sair"
  codigo = gets.chomp.to_i 

    case 
      when codigo == 0
        puts "Até mais!"
        break 
      when codigo == 1
        todos_contatos
      when codigo == 2 
        adicionar_contato
      when codigo == 3
        ver_contato
      when codigo == 4
        editar_contato
      when codigo == 5
        remover_contato
      else 
        puts "Esta Função não existe. Digite um comando válido."        
    end
end 