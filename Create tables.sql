DROP TABLE IF EXISTS bank_churn;

CREATE TABLE bank_churn (
    row_number INT,
    customer_id BIGINT,
    surname VARCHAR(50),
    credit_score INT,
    geography VARCHAR(50),
    gender VARCHAR(20),
    age INT,
    tenure INT,
    balance FLOAT,
    num_of_products INT,
    has_cr_card INT,      -- 1 = Yes, 0 = No
    is_active_member INT, -- 1 = Yes, 0 = No
    estimated_salary FLOAT,
    exited INT            -- 1 = Left (Churned), 0 = Stayed
);


Select * From bank_churn