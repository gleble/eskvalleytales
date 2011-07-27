Order = Struct.new(:email, :total)
order = Order.new("neil_bye@hotmail.com", 19.95)
mail = OrderMailer.confirmation(order)

mail.to      # => ["cody@example.com"]
mail.from    # => ["order-confirm@example.com"]
mail.subject # => "Your PDF purchase"
mail.deliver
