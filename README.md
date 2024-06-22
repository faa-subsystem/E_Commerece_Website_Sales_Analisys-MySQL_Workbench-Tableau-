# E_Commerece_Website_Sales_and_Users_insights_-MySQ-LWorkbench_Tableau

The Marketing team of an E-commerce company wants to understand the most important metrics for the website visitors using the past 6-months data collected from the User Behavior Tracking (UBT) reports. The insights found in this analysis will lead to data driven decisions to adapt the services and marketing to customer preference and consequently increase the number of subscriptions.

In the report, I  inlcuded the queries and their respective outputs, so it is more explisit and the data story is more fluent.


Tools in this analysis include MySQL workbench, joins, data filtering, import/load query Tableau, etc
Exploratory and Diagnostic Analysis Project made in MySQL Workbench.

<img style="width:6.87333in;height:2.19653in" />
<img src="/src/peigzfp1.png" style="width:6.25in;height:1.57292in" />

> **E-Commerce** **Website** **Usage**

By Faury A. Abreu 09/02/2023

**Objective:**

The Service Optimization and The Marketing team of an E-commerce company
wants to understand the most important metrics for the website visitors
using the past 6-months data collected from the User Behavior Tracking
(UBT) reports. The insights found in this analysis will lead to data
driven decisions to adapt the services and marketing to customer
preference and consequently increase the number of subscriptions.

**Visualizations:**

[<u>Tableau
Dashboard</u>](https://public.tableau.com/app/profile/faury.a./viz/E-CommerceWebsiteAnalysis/Dashboard1)

> I highly recommend looking to the dashboard during your journey
> through this report.

**Data** **information:**

> \- The dataset contains 6-month data (Sep 2020 – Feb 2021) from a
> large electronics online store. - The data in Events table is driven
> by (UBT) reports from the oficial website.
>
> \- Each row in the table represents an event. All events are related
> to products and users. Each event is like many-to-many relation
> between products and users.
>
> \- Source: [<u>Data
> Source</u>](https://www.kaggle.com/datasets/mkechinov/ecommerce-events-history-in-electronics-store)
> Data collected by [<u>Open CDP</u>](https://rees46.com/en/open-cdp)
> from open source UBT data.

**Table** **Structure:**

<img src="/src/hb3yboyi.png" style="width:2.675in;height:0.9in" />


> \- **Event** **types:**
>
> • **view** - a user viewed a product.
>
> • **cart** - a user added a product to shopping cart.
>
> • **remove_from_cart** - a user removed a product from shopping cart.
> • **purchase** - a user purchased a product.
>
> • **Time_on_website**: time spend by user on the website.

**Business** **Tasks:**

> 1\) Find the most popular device category based on sales. 2)
> Distribution of all sales based on different event type. 3)
> Distribution of all event_type over daytime.
>
> 4\) Top 10 brands by sales.
>
> 5\) Distribution of website activity over daytime.

**Data** **Preparation/Formating:**

Since it is a relatively large table, I will use wizard, then input the
data using a LOAD based query. Note that the file should be in an exact
location so MySQL can detect it without error 1290. The indicated
location is at the “Upload” file within the MySQL program file.

Also, in order to make the exploratory analysis process clearer and more
concise, it is recommended to split the datetime field into year, month,
day, and time. To do this I modified the table by converting the data to
the correct datatypes then I altered the table to create new variables
and input the data.


<img src="/src/p0tbphi4.png" style="width:2.5in;height:2.21667in" />
<img src="/src/4ucfuduj.png" style="width:2.9118in;height:1.25832in" />

Now that all necessary changes have been executed, its time for the
analysis:

**Exploratory** **Analysis:**

For the exploratory analysis I decided to start by exploring the factors
that affected the sales by filtering the data and applying specific
conditions:

> **1)** **Sales** **by** **Month:**

Observations:

> \- The month with most sales was January 2021, with \$ 1,488,410.57 in
> sales. - The month with less sales was September 2020 with \$
> 96,353.01 in sales.
>
> \- Sales show a growth trend, except for February 2021, with a drop in
> sales of \$ 111,595.03.
>
> **2)** **Time** **of** **the** **day** **with** **most** **views**
> **on** **the** **website:**

<img src="/src/j2w1iclo.png" style="width:3.96667in;height:1.76667in" />
<img src="/src/bgphh2qq.png" style="width:0.94167in;height:3.6in" />

Observations:

> \- The website reports the most activity at 11:00 AM UTC. - Least
> activity is reported at 1:00 AM UTC.
>
> **3)** **Time** **of** **the** **day** **with** **most**
> **purchases:**

<img src="/src/cqp4emxg.png" style="width:3.14917in;height:2.69444in" />
<img src="/src/odsxwnzt.png" style="width:1.33333in;height:3.60833in" />
<img src="/src/x4c1yfuy.png" style="width:4.34167in;height:1.88333in" />
<img src="/src/bma0eqoa.png" style="width:1.68333in;height:1.60833in" />

Observations:

> \- Time of the day with most purchases is during 10:00 AM UTC. - Least
> sales reported during 1:00 AM
>
> \- In general terms, from 8:00 AM to 2:00PM is the period with most
> sales.
>
> **4)** **Top** **10** **brands** **by** **sales**

Observations:

> \- MSI was the brand with most sales with \$643,492.34.
>
> \- Even though there is a considerable amount of sales with no
> specified brand \$594,729.99, the Gigabyte and Palit were the second
> and third most sold brands with \$556,183.04 and \$484,210.58
> respectively.

<img src="/src/tmmpo5m1.png" style="width:2.64167in;height:2.43333in" />
<img src="/src/pcsat3v2.png" style="width:3.05833in;height:1.60833in" />

> \- The brand that sold the most times in terms of product was MSI
> (1788 times sold), followed by Gigabyte (1741 times sold) and Asus
> (1261 times sold)
>
> **5)** **Demand** **for** **items.** **Top** **10** **Bestselling**
> **products:**

Observations:

> \- Computer products are predominating the top.
>
> \- Being the three bestselling products: Video cards \$ 2,604,764.8,
> printers \$ 364,566.8, and CPU \$ 219,168.98
>
> \- Most purchased products are Video cards (6888 purchases),
> telephones (4119), and cartage (2739 purchases)
>
> **6)** **Frequency** **of** **purchase** **by** **customers**

<img src="/src/enrwyrok.png" style="width:4.37417in;height:3.27708in" />
<img src="/src/te1rr1q0.png" style="width:1.58264in;height:1.49931in" />

Observations:

> \- The most clients only made one purchase being the ~64% of total
> clients. - ~35% of clients made 2 to 10 purchases.
>
> \- Customer recurrence can be better.

**Diagnosis** **analysis**

For the Diagnosis analysis ill explore some factor in order to find the
effects of the huge difference in frequency of purchase by customers.
I’m sure that the key is on the variables that contain customer’s
behavior data, to find insights regarding to purchase rate. The main
variable with this data is event_type, since it defines the actions made
by the visitors on the website.

> **7)** **How** **many** **viewed** **products** **where** **actually**
> **purchased?**

<img src="/src/zltf5511.png" style="width:4.13333in;height:3.30833in" />
<img src="/src/41jkrmah.png" style="width:2.04167in;height:0.41667in" />

Observations:

> \- Only the 4.5% of viewed products where actually purchased.
>
> **8)** **What** **percentage** **of** **products** **in** **client’s**
> **carts** **where** **actually** **purchased?**

<img src="/src/yt0dsj5q.png" style="width:4.00792in;height:3.26597in" />
<img src="/src/fjqnqoa0.png" style="width:2.06458in;height:0.44162in" />Observations:

> \- 40.9% of products in carts where actually purchased.

Conclusions:

> 1\) In order to gain more clients, it is recommended to **run**
> **the** ***marketing*** ***campaign*** **during** **January,**
> **February** **and** **March**, given those are the months with most
> sales.
>
> 2\) To complement the marketing campaign**,** **implement** **a**
> **“*Countdown*** ***Timer*”.** Countdown timers allow to improve
> conversions on special occasions (offers, Black Friday, Christmas...)
> when there is a limited time to buy, or constantly showing the
> remaining time to receive the order the next day, as Amazon does.
>
> 3\) Implement **“*Cross-Selling*”** **purchase** **suggestion** **on**
> **the** **website**. Cross-selling consist in offer complementary
> products to those a customer is purchasing. For example, if customer
> is adding a Motherboard to the cart, suggest good options for CPU or
> Cooler fans, this way the client will be engaged to the suggestions.
>
> 4\) To increase the percentage of products purchased from the cart,
> there are several options: a. **Pay** **attention** **to** **the**
> ***reviews*** ***and*** ***ratings*.** Many customers change their
> minds when
>
> products have bad reviews, in which case, products with bad reviews
> should be reduced or eliminated from inventory once they are sold.
>
> b\. **Apply** **a** ***CRO*** ***(Conversion*** ***Rate***
> ***Optimization).*** A CRO is a set of techniques or strategies that
> aim, as its name suggests, to improve the conversion rate and increase
> sales in ecommerce, optimizing different elements and processes. One
> of those strategies is *Optimization* *of* *forms*. Up to 34% of
> online buyers say they have abandoned a purchase because the form or
> checkout process was too long. Improve this process or even choose to
> implement 'Pay with PayPal' or 'Pay with Google' buttons that allow
> users to automatically enter their data and check out in a single
> click.
>
> 5\) **More** **availability** **of** **top** **selling** **products**
> like MSI and Gigabyte, so they don’t get out of stock.
