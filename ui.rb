def da_boas_vindas
    puts "Bem vindo ao jogo da forca"
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n"
    puts "Começaremos o jogo pra você, #{nome}."
    nome
end

def nao_quer_jogar?
    puts "Deseja jogar novamente? (S/N)"
    quero_jogar = gets.strip
    nao_quero_jogar = quero_jogar.upcase == "S"
end

def cabecalho_de_tentativas(chutes, erros, mascara)
    puts "\n\n\n\n"
    puts "Palavra secreta: #{mascara}"
    puts "Erros ate agora: #{erros}"
    puts "Chutes ate agora: #{chutes}"
end

def pede_um_chute
    puts "Entre com uma letra ou uma palavra"
    chute = gets.strip.downcase
    puts "Sera que voce acertou?"
    chute
end

def avisa_chute_efetuado(chute)
    puts "voce ja chutou #{chute}"
end

def avisa_letra_nao_encontrada
    puts "Letra nao encontrada"
end

def avisa_letra_encontrada(total_encontrado)
    puts "letra encontrada #{total_encontrado} vezes"
end

def avisa_acertou_a_palavra
    puts "Parabens, voce acertou!"
end

def avisa_errou_palavra
    puts "Que pena, voce errou!"
end

def avisa_pontos(pontos_ate_agora)
    puts "voce ganhou #{pontos_ate_agora} pontos."
end

def avisa_escolhendo_palavra_secreta
    puts "Escolhendo palavra secreta..."
end

def avisa_palavra_escolhida(palavra_secreta)
    puts "Palavra secreta com #{palavra_secreta.size} letras, boa sorte!"
    palavra_secreta
end

def avisa_pontos_totais(pontos_totais)
    puts "Voce possui #{pontos_totais} pontos"
end
