require_relative './../../spec_helper.rb'

describe LinkModule::ListService do
  before do
    @company = create(:company)
  end

  describe '#call' do
    it "with list command: With zero faqs, return don't find message" do
      @listService = LinkModule::ListService.new({}, 'list_link')

      response = @listService.call()
      expect(response).to match("Nada encontrado")
    end

    it "with list command: With two links, find description and link in response" do
      @listService = LinkModule::ListService.new({}, 'list_link')

      link1 = create(:link, company: @company)
      link2 = create(:link, company: @company)

      response = @listService.call()

      expect(response).to match(link1.description)
      expect(response).to match(link1.link)

      expect(response).to match(link2.description)
      expect(response).to match(link2.link)
    end

    it "with search command: With empty query, return don't find message" do
      @listService = LinkModule::ListService.new({'query' => ''}, 'search_link')

      response = @listService.call()
      expect(response).to match("Nada encontrado")
    end

    it "with search command: With valid query, find description and link in response" do
      link = create(:link, company: @company)

      @listService = LinkModule::ListService.new({'query' => link.description.split(" ").sample}, 'search_link')

      response = @listService.call()

      expect(response).to match(link.description)
      expect(response).to match(link.link)
    end

    it "with search_by_hashtag command: With invalid hashtag, return don't find message" do
      @listService = LinkModule::ListService.new({'query' => ''}, 'search_by_link_hashtag')

      response = @listService.call()
      expect(response).to match("Nada encontrado")
    end

    it "with search_by_hashtag command: With valid hashtag, find description and link in response" do
      link = create(:link, company: @company)
      hashtag = create(:hashtag, company: @company)
      create(:link_hashtag, link: link, hashtag: hashtag)

      @listService = LinkModule::ListService.new({'query' => hashtag.name}, 'search_by_link_hashtag')

      response = @listService.call()

      expect(response).to match(link.description)
      expect(response).to match(link.link)
    end
  end
end
