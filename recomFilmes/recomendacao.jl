using CSV, DataFrames, Dates 


df = CSV.read("filmes.csv", DataFrame)
df = unique(df)

dfGeneros = CSV.read("generos.csv", DataFrame)


function recomendarPorGeneroAvaliacao(genero)   
    filmesSimilares = filter(row -> occursin(genero, row.generos), df)
    filmesSimilares = sort(filmesSimilares, :avaliacao_usuarios, rev=true)

    return join(["$(filmesSimilares.titulo[i]) - $(filmesSimilares.avaliacao_usuarios[i])/10" for i in 1:min(10, nrow(filmesSimilares))], "\n")
   
end


function recomendarPorGeneroReceita(genero)
    filmesSimilares = filter(row -> occursin(genero, row.generos), df)
    filmesSimilares = sort(filmesSimilares, :receita, rev=true)
    
    return join(["$(filmesSimilares.titulo[i]) - $(filmesSimilares.receita[i])" for i in 1:min(10, nrow(filmesSimilares))], "\n")
end


function recomendarPorAnoAvaliacao(ano)
    filmesSimilares = filter(row -> !ismissing(row.data_lancamento) && Dates.year(row.data_lancamento) == ano, df)
  
    filmesSimilares = sort(filmesSimilares, :avaliacao_usuarios, rev=true)

    return join(["$(filmesSimilares.titulo[i]) - $(filmesSimilares.avaliacao_usuarios[i])/10" for i in 1:min(10, nrow(filmesSimilares))], "\n")
end


function recomendarPorAnoReceita(ano)
    filmesSimilares = filter(row -> !ismissing(row.data_lancamento) && Dates.year(row.data_lancamento) == ano, df)

    filmesSimilares = sort(filmesSimilares, :receita, rev=true)

    return join(["$(filmesSimilares.titulo[i]) - $(filmesSimilares.receita[i])" for i in 1:min(10, nrow(filmesSimilares))], "\n")
end
