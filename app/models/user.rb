class User < ApplicationRecord
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :friendships
  has_many :friends, through: :friendships

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Following method checks if the user stock count is less than ten, we will use it to determine if he can add more stocks to the portfolio and also to display the proper message in case this is true.
  def tracking_limit_exceeded?
    stocks.count < 10
  end

  def already_tracking?(ticker_symbol)
    # First we check if the stock already exists in our table, if it doesn't it means that the user is not tracking it for sure. Notice that we are using our Stock.check_db instance method to check in the DB (calling and reusing method):
    stock = Stock.check_db(ticker_symbol)
    # Next condition allows the method to carry on in case there is no stock object with said ticker_symbol:
    return false unless stock
    # If we reach this point, it means that the stock exists in the DB, however, we still need to check if the current user is tracking it:
    stocks.where(id: stock.id).exists?
  end

  # Finally, this method calls both of our previous methods to determine if the stock can be added to our tracked stocks portfolio
  def can_track_stock?(ticker_symbol)
    tracking_limit_exceeded? && !already_tracking?(ticker_symbol)
  end

  def full_name
    return "#{first_name} #{last_name}" if first_name || last_name
    "Anonymous Mofo"
  end
end
