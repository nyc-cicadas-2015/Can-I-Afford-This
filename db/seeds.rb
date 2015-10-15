Dian = User.create(name: "Dian Pan", email: "dian@example.com", password: "abc123", income: 4000)
Julianna = User.create(name: "Julianna Rusakiewicz", email: "juls@example.com", password: "123456", income: 3000)
Jenny = User.create(name: "Jenny Lee", email: "jellylee@example.com", password: "iamjenny", income: 1200)

Dian.expenses.create(expense_type_id: 1, amount: 1000)
Dian.expenses.create(expense_type_id: 2, amount: 300)
Dian.expenses.create(expense_type_id: 3, amount: 500)
Dian.expenses.create(expense_type_id: 4, amount: 100)
Dian.expenses.create(expense_type_id: 5, amount: 700)

Dian.purchases.create(purchase_type_id: 2, cost: 1500, title: "Macbook Pro")
Dian.purchases.create(purchase_type_id: 1, cost: 350, title: "Beats Headphones")

Dian.savings.create(amount: 1400)

Julianna.expenses.create(expense_type_id: 1, amount: 750)
Julianna.expenses.create(expense_type_id: 2, amount: 225)
Julianna.expenses.create(expense_type_id: 3, amount: 500)
Julianna.expenses.create(expense_type_id: 4, amount: 75)
Julianna.expenses.create(expense_type_id: 5, amount: 1000)

Julianna.savings.create(amount: 1400)

Jenny.expenses.create(expense_type_id: 1, amount: 600)
Jenny.expenses.create(expense_type_id: 2, amount: 150)
Jenny.expenses.create(expense_type_id: 3, amount: 300)
Jenny.expenses.create(expense_type_id: 4, amount: 50)
Jenny.expenses.create(expense_type_id: 5, amount: 150)

Jenny.savings.create(amount: 400)

Jenny.purchases.create(purchase_type_id: 2, cost: 2500, title: "Used car")

ExpenseType.create(name: "Housing")
ExpenseType.create(name: "Transportation")
ExpenseType.create(name: "Food")
ExpenseType.create(name: "Phone")
ExpenseType.create(name: "Misc")


PurchaseType.create(name:"small")
PurchaseType.create(name:"medium")
PurchaseType.create(name:"large")