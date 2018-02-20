class InterpretService
  def self.call action, params
    case action
    when "list", "search", "search_by_hashtag"
      FaqModule::ListService.new(params, action).call()
    when "roster", "search_link", "search_by_link_hashtag"
      FaqModule::RosterService.new(params, action).call()
    when "create", "create_link"
      FaqModule::CreateService.new(params).call()
    when "remove", "remove_link"
      FaqModule::RemoveService.new(params).call()
    when "help"
      HelpService.call()
    else
      "Não compreendi o seu desejo."
    end
  end
end
