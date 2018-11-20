class BankAccount

  @@interest_rate = 0.06
  @@accounts = []

  def initialize
    @balance = 0
  end

  def balance
    return @balance
  end

  def balance=(new_balance)
    @balance = new_balance
  end

  def deposit(value)
    @balance += value
  end

  def withdraw(value)
    @balance -= value
  end

  def self.create
    account = BankAccount.new
    @@accounts << account
    return account
  end

  def self.total_funds
    funds = 0
      @@accounts.each do |account|
        funds += account.balance
      end
    return funds
  end

  def self.interest_time
    @@accounts.each do |account|
      account.balance
      interest_earned = account.balance * (1 + @@interest_rate)
      return "#{interest_earned}"
    end
  end

end

my_account = BankAccount.create
bob_account = BankAccount.create
puts my_account.balance
puts bob_account.balance
puts BankAccount.total_funds
puts my_account.deposit(500)
puts my_account.balance
puts bob_account.deposit(750)
puts bob_account.balance
puts BankAccount.total_funds
puts my_account.withdraw(120)
puts my_account.balance
puts bob_account.withdraw(250)
puts bob_account.balance
puts BankAccount.total_funds
puts BankAccount.interest_time
