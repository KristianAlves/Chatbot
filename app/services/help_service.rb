class HelpService
  def self.call
    response  = "*O que eu sei fazer :raised_hands:* \n\n"
    response += "*help*\n"
    response += ">Lista de comandos que eu conheço\n\n"
    response += "*Adicione ao Faq*\n"
    response += ">Adiciona uma nova questão ao Faq\n\n"
    response += "*Remova ID*\n"
    response += ">Remove uma questão baseada no ID dela\n\n"
    response += "*O que você sabe sobre X*\n"
    response += ">Pesquisa por palavra na lista de perguntas e respostas\n\n"
    response += "*Pesquise a hashtag X*\n"
    response += ">Lista as perguntas e respostas com aquela hashtag\n\n"
    response += "*Perguntas e Respostas*\n"
    response += ">Mostra a lista de perguntas e respostas\n\n"
    response += "*Adicionar link*\n"
    response += ">Adiciona um novo link para o Agregador de Links\n\n"
    response += "*Remova link ID*\n"
    response += ">Remove um link baseado no ID dele\n\n"
    response += "*Algum link sobre X*\n"
    response += ">Pesquisa por palavra na lista de Links\n\n"

  end
end