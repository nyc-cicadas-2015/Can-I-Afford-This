# Can-I-Afford-This
a financial education tool for kids, or anyone

####Made with <3 by: [Dian Pan](https://github.com/dianpan) and [Julianna Rusak](https://github.com/julrusak) 
Pulling from personal experience, we are aiming to educate others on the risks of credit card dependencies and acquiring debt at a young age.  

[Trello Board](https://trello.com/b/PP3LXD4i)

##User Stories 
- I want to buy an iPhone, can I afford it with the amount of money I currently make and spend 
- I want to buy a Macbook pro, can I do so with the amount of money I currently make and spend 
- I want to buy a car, can I do so with the amount of money I currently make and spend 

##MVP 
- user can register
- user login
- user can input expense sheet (5 categories hardcoded, 3 free form miscellaneous)
- user can input income (biweekly, weekly, monthly)
- user can see data visualization of their expense vs income 
- user can see baseline national spend numbers against their spendings
- user can select 3 types of planned purchase: 
  - $ under 1K (ie beats headphones, iphone) /  limit payoff time: 6 months 
  - $$ 1K-3K (ie macbook pro) / limit payoff time: 1 year 
  - $$$ 3K+ (ie car) / limit payoff time: 5 years
- user can, input exact price of item seeking to purchase 
- user can see, based on existing expense vs. income level if they can afford to make purchase
  - yes you can afford it, you have $X left over each month, save it and it will take you #X of months 
    - save to profile page this planned purchase 
  - no you can’t afford it, based on national spend average, try to cut back on xyz category
    - user can edit original expense sheet
    - user can compare expense sheet against national average 
    - user’s new updated data chart can fluctuate as they make edits

##Stretches 
- users can plan to open a credit card (to decode financial jargon, highlight most important terms)
- users can plan to apply for a loan - these are the risks, average range of % of interest across loan types 
- user can read and/or give tips and tricks
- Use a 3rd party API to pull in current spend data 