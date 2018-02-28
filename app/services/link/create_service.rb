module LinkModule
  class CreateService
    def initialize(params)
      # TODO: identify origin and set company
      @company = Company.last
      @description = params["description-original"]
      @link = params["link-original"]
    end

    def call
      Link.transaction do
        link = Link.create(description: @description, link: @link, company: @company)
      end
      "Criado com sucesso"
    end
  end
end