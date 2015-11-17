# Can-I-Afford-This
a beginner friendly financial education tool for anyone

[![Circle CI](https://circleci.com/gh/nyc-cicadas-2015/Can-I-Afford-This.svg?style=svg)](https://circleci.com/gh/nyc-cicadas-2015/Can-I-Afford-This)

[![Coverage Status](https://coveralls.io/repos/nyc-cicadas-2015/Can-I-Afford-This/badge.svg?branch=master&service=github)](https://coveralls.io/github/nyc-cicadas-2015/Can-I-Afford-This?branch=master)

####Made with <3 by: [Dian Pan](https://github.com/dianpan) and [Julianna Rusak](https://github.com/julrusak)
Pulling from personal experience, we aim to educate young adults on the risks of acquiring debt at a young age.

[Trello Board](https://trello.com/b/PP3LXD4i)

##Database Schema
![schema](https://github.com/dianpan/Can-I-Afford-This/blob/update-schema/app/assets/images/schema_design.png?raw=true)

##User Stories
- I want to buy an iPhone, can I afford it with the amount of money I currently make and spend
- I want to buy a Macbook pro, can I afford it with the amount of money I currently make and spend
- I want to buy a car, can I afford it with the amount of money I currently make and spend

##MVP
- user can register
- user can login
- user is prompted to input monthly income
- user is prompted to input monthly expense sheet
- user can see data visualization of their expense vs income
- user can see what % of expenses go to which category
- user can select 3 types of planned purchases:
  - $ under 1K (ie beats headphones, iphone) /  limit payoff time: 6 months
  - $$ 1K-3K (ie macbook pro) / limit payoff time: 1 year
  - $$$ 3K+ (ie car) / limit payoff time: 5 years
- user can, input price of item seeking to purchase
- user can see data visualization of all of their planned purchases
- user can see, based on existing expense vs. income level if they can afford to make purchase
  - yes you can afford it, you have $X left over each month, save it and it will take you #X of months
  - no you cannot afford it, based on national spend average, try to cut back on xyz category
    - user can edit original expense sheet
    - user can compare expense sheet against national average
    - user’s new updated data chart can fluctuate as they make edits

##Stretches
- user can input a URL of the item they are seeking to purchases
- user can see baseline national spend numbers against their spendings
- users can plan to open a credit card (to decode financial jargon, highlight most important terms)
- users can plan to apply for a loan - these are the risks, average range of % of interest across loan types
- user can read and/or give tips and tricks
- Use an API to pull in current spend data
