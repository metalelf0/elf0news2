class Clients::StackExchange

  BASE_URL         = 'https://api.stackexchange.com'

  def fetch_user(user_name, connection=nil)
    connection ||= Faraday.new(url: BASE_URL)
    response = connection.get(users_path(user_name, 'stackoverflow'))
    users = JSON.parse(response.body)
    users['items'].select { |user| user['display_name'] == user_name }.first
  end

  private

  def users_path(user_name_filter, service)
    "/2.2/users?site=#{service}&inname=#{user_name_filter}"
  end

end
