# Project BMArt Database

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/your-repository.git
   cd your-repository

   
+-------------+       +-------------+       +-------------+       +-------------+
|   Products  |       |   Customers |       |    Dates    |       |    Stores   |
+-------------+       +-------------+       +-------------+       +-------------+
| product_id  |       | customer_id |       |    date_id  |       |   store_id  |
| name        |       | first_name  |       |    date     |       |   name      |
| category    |       | last_name   |       | day_of_week |       |   location  |
| price       |       | email       |       |  month      |       |             |
|             |       |             |       |  quarter    |       |             |
|             |       |             |       |   year      |       |             |
+-------------+       +-------------+       +-------------+       +-------------+
       |                      |                     |                      |
       +----------------------+---------------------+----------------------+
                                   |
                              +------------+
                              |    Sales    |
                              +------------+
                              |  sale_id    |
                              | product_id  |
                              | customer_id |
                              |  date_id    |
                              |  store_id   |
                              | quantity    |
                              | total_price |
                              +------------+
