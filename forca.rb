require_relative "ui"

def palavra_mascarada(chutes, palavra_mascarada)
    mascara = ""
    for letra in palavra_mascarada.chars
        if chutes.include? letra
            mascara << letra
        else
            mascara << "_"
        end
    end
    mascara
end

def escolhe_palavra_secreta
    avisa_escolhendo_palavra_secreta
    texto = File.read("dicionario.txt")
    todas_as_palavras = texto.split "\n"
    numero_escolhido = rand(todas_as_palavras.size)
    palavra_secreta = todas_as_palavras[numero_escolhido].downcase
    avisa_palavra_escolhida palavra_secreta
end

def escolhe_palavra_secreta_sem_consumir_muita_memoria
    avisa_escolhendo_palavra_secreta
    arquivo = File.new("dicionario.txt")
    quantidade_de_palavras = arquivo.gets.to_i
    numero_escolhido = rand(quantidade_de_palavras)
    for linha in 1..(numero_escolhido - 1)
        arquivo.gets
    end
    palavra_secreta = arquivo.gets.strip.downcase
    avisa_palavra_escolhida palavra_secreta
end


def pede_um_chute_valido(chutes, erros, mascara)
    cabecalho_de_tentativas chutes, erros, mascara
    loop do
        chute = pede_um_chute
        if chutes.include? chute
            avisa_chute_efetuado chute
        else
            return chute
        end

    end
end

def joga(nome)
    palavra_secreta = escolhe_palavra_secreta

    erros = 0
    chutes = []
    pontos_ate_agora = 0

    while erros < 5
        mascara = palavra_mascarada chutes, palavra_secreta
        chute = pede_um_chute_valido chutes, erros, mascara
        chutes << chute

        chutou_uma_letra = chute.size == 1
        if chutou_uma_letra
            letra_procurada = chute[0]
            total_encontrado = palavra_secreta.count letra_procurada
            if total_encontrado == 0
                avisa_letra_nao_encontrada
                erros += 1
            else
                avisa_letra_encontrada total_encontrado
            end
        else
            acertou = chute == palavra_secreta
            if acertou
                avisa_acertou_a_palavra
                pontos_ate_agora += 100
                break
            else
                avisa_errou_palavra
                pontos_ate_agora -= 30
                erros += 1
            end
        end
    end

    avisa_pontos pontos_ate_agora
    pontos_ate_agora
end

def jogo_da_forca
    nome = da_boas_vindas
    pontos_totais = 0
    loop do
        pontos_totais += joga nome
        if nao_quer_jogar?
            break
        end
    end
end
