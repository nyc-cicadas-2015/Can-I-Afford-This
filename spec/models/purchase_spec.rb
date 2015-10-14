require 'rails_helper'

describe Purchase do
  it 'is valid with a title, cost and purchase type id' do
    purchase = Purchase.new(
      title: "beats headphones",
      cost: 250,
      purchase_type_id: 1)
    expect(purchase).to be_valid
  end
  it 'is invalid without a title' do
    purchase = Purchase.new(title: nil)
    purchase.valid?
    expect(purchase.errors[:title]).to include("can't be blank")
  end
  it 'is invalid without a cost' do
    purchase = Purchase.new(cost: nil)
    purchase.valid?
    expect(purchase.errors[:cost]).to include("can't be blank")
  end
  it 'is invalid without a purchase type id' do
    purchase = Purchase.new(purchase_type_id: nil)
    expect(purchase.valid?).to eq(false)
  end
  it 'adds the correct purchase type id for a small purchase' do
    user = User.create(name:"Dian", email: "dian@test.com", password: "abc123")
    purchase = user.purchases.create(title: "test", cost: 100)
    expect(purchase.purchase_type_id).to eq(1)
  end
  it 'adds the correct purchase type id for a medium purchase' do
    user = User.create(name:"Dian", email: "dian@test.com", password: "abc123")
    purchase = user.purchases.create(title: "test", cost: 2000)
    expect(purchase.purchase_type_id).to eq(2)
  end
  it 'adds the correct purchase type id for a large purchase' do
    user = User.create(name:"Dian", email: "dian@test.com", password: "abc123")
    purchase = user.purchases.create(title: "test", cost: 5000)
    expect(purchase.purchase_type_id).to eq(3)
  end
  it "adds the correct payoff time for a small purchase" do
    user = User.create(name:"Dian", email: "dian@test.com", password: "abc123")
    purchase = user.purchases.create(title: "test", cost: 200, purchase_type_id: 1)
    expect(purchase.add_payoff_time).to eq(6)
  end
  it "adds the correct payoff time for a medium purchase" do
    user = User.create(name:"Dian", email: "dian@test.com", password: "abc123")
    purchase = user.purchases.create(title: "test", cost: 2000, purchase_type_id: 2)
    expect(purchase.add_payoff_time).to eq(12)
  end
  it "adds the correct payoff time for a large purchase" do
    user = User.create(name:"Dian", email: "dian@test.com", password: "abc123")
    purchase = user.purchases.create(title: "test", cost: 4000, purchase_type_id: 3)
    expect(purchase.add_payoff_time).to eq(60)
  end
  it 'finds a users income' do
    user = User.create(name:"Dian", email: "dian@test.com", password: "abc123", income: 2000)
    user.expenses.create(expense_type_id: 2, amount:2000)
    purchase = user.purchases.create(title: "test", cost: 4000, purchase_type_id: 3)
    expect(purchase.find_user_income).to eq(2000)
  end
  it 'finds total user expense' do
    user = User.create(name:"Dian", email: "dian@test.com", password: "abc123", income: 2000)
    user.expenses.create(expense_type_id: 2, amount:2000)
    purchase = user.purchases.create(title: "test", cost: 4000, purchase_type_id: 3)
    expect(purchase.find_user_expense).to eq(2000)
  end
  it 'finds a users net savings each month' do
    user = User.create(name:"Dian", email: "dian@test.com", password: "abc123", income: 2000)
    user.expenses.create(expense_type_id: 2, amount:2000)
    purchase = user.purchases.create(title: "test", cost: 4000, purchase_type_id: 3)
    expect(purchase.user_income_to_expense_diff).to eq(0)
  end
  it 'finds a users purchase cost' do
    user = User.create(name:"Dian", email: "dian@test.com", password: "abc123", income: 2000)
    purchase = user.purchases.create(title: "test", cost: 4000, purchase_type_id: 3)
    expect(purchase.purchase_cost).to eq(4000)
  end
  it 'finds a users purchase payoff time' do
    user = User.create(name:"Dian", email: "dian@test.com", password: "abc123", income: 2000)
    purchase = user.purchases.create(title: "test", cost: 4000, purchase_type_id: 3)
    expect(purchase.max_payoff_time).to eq(60)
  end
end