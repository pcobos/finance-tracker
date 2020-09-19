class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker_symbol, presence: true

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )

    # The following is an exception to handle invalid ticker searches (other than empty). Basically, if it doesn't find the symbol, it will return nil and then it will render the portfolio form again. It's similar to a conditional in a way.
    begin
      new(name: client.company(ticker_symbol).company_name , ticker: ticker_symbol, last_price: client.price(ticker_symbol))
    rescue => exception
      return nil
    end
  end
  
end
