def da_boas_vindas
    puts "Bem vindo ao jogo da forca"
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n"
    puts "Começaremos o jogo pra você, #{nome}."
    nome
end

def escolhe_palavra_secreta
    puts "Escolhendo palavra secreta..."
    palavra_secreta = "programador"
    puts "Palavra secreta com #{palavra_secreta.size} letras, boa sorte!"
    palavra_secreta
end

def nao_quer_jogar?
    puts "Deseja jogar novamente? (S/N)"
    quero_jogar = gets.strip
    nao_quero_jogar = quero_jogar.upcase == "S"
end

def pede_um_chute(chutes, erros)
    puts "\n\n\n\n"
    puts "Erros ate agora: #{erros}"
    puts "Chutes ate agora: #{chutes}"
    puts "Entre com uma letra ou uma palavra"
    chute = gets.strip
    puts "Sera que voce acertou?"
    chute
end

def joga(nome)
    palavra_secreta = escolhe_palavra_secreta

    erros = 0
    chutes = []
    pontos_ate_agora = 0

    while erros < 5
        chute = pede_um_chute chutes, erros
        if chutes.include? chute
            puts "voce ja chutou essa letra"
            next
        end
        chutes << chute

        chutou_uma_letra = chute.size == 1
        if chutou_uma_letra
            letra_procurada = chute[0]
            total_encontrado = palavra_secreta.count letra_procurada
            if total_encontrado == 0
                puts "Letra nao encontrada"
                erros += 1
            else
                puts "letra encontrada #{total_encontrado} vezes"
            end
        else
            acertou = chute == palavra_secreta
            if acertou
                puts "Parabens, voce acertou!"
                pontos_ate_agora += 100
                break
            else
                puts "Que pena, voce errou!"
                pontos_ate_agora -= 30
                erros += 1
            end
        end
    end

    puts "voce ganhou #{pontos_ate_agora} pontos."
end

nome = da_boas_vindas

loop do
    joga nome
    if nao_quer_jogar?
        break
    end
end
