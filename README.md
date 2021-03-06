Employee Monthly Payslip
========================


Running
-------------------
```
bundle install

```

```
rails s

```

Running the Automated Tests
---------------------------

`bin/rails test`

Assumptions Made When Developing the Solution
---------------------------------------------

- The input CSV file is ok
- All payment periods allways one month

Issue
-----------

When I input the employee's details: first name, last name, annual salary
(positive integer) and super rate (0% - 50% inclusive), payment period, the
program should generate payslip information with name, pay period, gross income,
income tax, net income and super.

Calculation Details
-------------------

The calculation details will be the following:
- pay period = per calendar month
- gross income = annual salary / 12 months
- income tax = based on the tax table provide below
- net income = gross income - income tax
- super = gross income x super rate

Notes: All calculation results should be rounded to the whole dollar. If >= 50
cents round up to the next dollar increment, otherwise round down.

Tax Rates
---------

The following rates for 2012-13 apply from 1 July 2012.

Taxable income     | Tax on this income
-------------------|-------------------------------------------
0 - $18,200        | Nil
$18,201 - $37,000  | 19c for each $1 over $18,200
$37,001 - $80,000  | $3,572 plus 32.5c for each $1 over $37,000
$80,001 - $180,000 | $17,547 plus 37c for each $1 over $80,000
$180,001 and over  | $54,547 plus 45c for each $1 over $180,000

The tax table is from ATO: <http://www.ato.gov.au/content/12333.htm>

Example Data
------------

Employee annual salary is 60,050, super rate is 9%, how much will this employee
be paid for the month of March ?

- pay period = Month of March (01 March to 31 March)
- gross income = 60,050 / 12 = 5,004.16666667 (round down) = 5,004
- income tax = (3,572 + (60,050 - 37,000) x 0.325) / 12  = 921.9375 (round up)
= 922
- net income = 5,004 - 922 = 4,082
- super = 5,004 x 9% = 450.36 (round down) = 450

CSV Input Format
----------------

(first name, last name, annual salary, super rate (%), payment period):  
David,Rudd,60050,9%,01 March - 31 March  
Ryan,Chen,120000,10%,01 March - 31 March  

CSV Output Format
-----------------

(name, pay period, gross income, income tax, net income, super):  
David Rudd,01 March - 31 March,5004,922,4082,450  
Ryan Chen,01 March - 31 March,10000,2696,7304,1000  
