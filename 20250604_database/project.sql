CREATE TABLE IF NOT EXISTS income_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS income (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    amount INT NOT NULL,
    income_date DATE NOT NULL,
    category_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES income_category(id)
);

CREATE TABLE IF NOT EXISTS expense_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS expense (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    amount INT NOT NULL,
    expense_date DATE NOT NULL,
    category_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES expense_category(id)
);


INSERT INTO income_category (name) VALUES
('Salary'),
('Business'),
('Investment'),
('Other');

INSERT INTO expense_category (name) VALUES
('Rent'),
('Utilities'),
('Groceries'),
('Transportation'),
('Entertainment'),
('Healthcare'),
('Other');

INSERT INTO income (title, amount, income_date, category_id) VALUES
('Monthly Salary', 5000, '2023-01-31', 1),
('Freelance Project', 1500, '2023-02-15', 2),
('Stock Dividends', 300, '2023-03-10', 3);

INSERT INTO expense (title, amount, expense_date, category_id) VALUES
('Monthly Rent', 1200, '2023-01-05', 1),
('Electricity Bill', 150, '2023-01-10', 2),
('Grocery Shopping', 300, '2023-01-15', 3),
('Public Transport', 100, '2023-01-20', 4),
('Movie Night', 50, '2023-01-25', 5);


SELECT
    i.id,
    i.title,
    i.amount,
    i.income_date as date,
    i.category_id,
    ic.name,
    i.created_at,
    i.updated_at,
    "収入" as type
FROM income as i
INNER JOIN income_category as ic
ON i.category_id = ic.id
UNION ALL
SELECT
    e.id,
    e.title,
    e.amount,
    e.expense_date as date,
    e.category_id,
    ec.name,
    e.created_at,
    e.updated_at,
    "支出" as type
FROM expense as e
INNER JOIN expense_category as ec
ON e.category_id = ec.id
ORDER BY date DESC;