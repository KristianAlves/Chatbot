module LinkModule
  class CreateLink
    def initialize(params)
      # TODO: identify origin and set company
      @company = Company.last
      @description = params["description-original"]
      @link = params["link-original"]
      @tags = params["tags-original"]
    end

    def call
      return "Tag Obrigatória" if @tags == nil
      Link.transaction do
        link = Link.create(description: @description, link: @link, company: @company)
        @tags.split(/[\s,]+/).each do |tag|
          link.tags << Tag.create(name: tag)
        end
      end
      "Criado com sucesso"
    end
  end
end