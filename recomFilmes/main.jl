include("recomendacao.jl")


while true
    println("1. Recomendar por gênero")
    println("2. Recomendar por ano de lançamento")
    println("3. Sair")

    escolha = readline()

    if escolha == "1"
        generosUnicos = dfGeneros.name

        println("Escolha um gênero:")
        for (i, genero) in enumerate(generosUnicos)
            println("$i. $genero")
        end
        indiceGenero = parse(Int, readline())
        genero = generosUnicos[indiceGenero]

        println("1. Recomendar por avaliação dos usuários")
        println("2. Recomendar por receita")

        subEscolha = readline()

        if subEscolha == "1"
            println(recomendarPorGeneroAvaliacao(genero))
        elseif subEscolha == "2"
            println(recomendarPorGeneroReceita(genero))
        else
            println("Escolha inválida. Tente novamente.")
        end
    elseif escolha == "2"
        println("Digite o ano de lançamento:")
        ano = parse(Int, readline())


        println("1. Recomendar por avaliação dos usuários")
        println("2. Recomendar por receita")

        subEscolha = readline()

       
        if subEscolha == "1"
            println(recomendarPorAnoAvaliacao(ano))
        elseif subEscolha == "2"
            println(recomendarPorAnoReceita(ano))
        else
            println("Escolha inválida. Tente novamente.")
        end
    elseif escolha == "3"
        break
    else
        print
        ln("Escolha inválida. Tente novamente.")
    end
end
