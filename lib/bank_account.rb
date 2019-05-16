class BankAccount

    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(deposit)
        #can deposit money into its account
        self.balance += deposit
    end

    def display_balance
        #can display account balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        #is valid with an open status and a balance greater than 0
        self.status == "open" && self.balance > 0
    end

    def close_account
        #can close its account
        self.status = "closed"
    end

end
