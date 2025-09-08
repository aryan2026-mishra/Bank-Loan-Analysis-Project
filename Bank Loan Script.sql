use bank_loan;
-- **********************
select * from bank_loan_data;
-- *******************************
select count(*) as Total_Loan_Application from bank_loan_data;
-- TypeCasting
-- *******************************
UPDATE bank_loan_data
SET issue_date = STR_TO_DATE(issue_date, '%d-%m-%Y');
ALTER TABLE bank_loan_data 
MODIFY COLUMN issue_date DATE;
-- ******************************
SELECT COUNT(*) as MTD_Total_Loan_Application
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
  AND YEAR(issue_date) = 2021;
-- *******************************
SELECT COUNT(*) as PMTD_Total_Loan_Application
FROM bank_loan_data
WHERE MONTH(issue_date) = 11
  AND YEAR(issue_date) = 2021;
-- *******************************
select sum(loan_amount) as Total_Funded_Amount from bank_loan_data where month(issue_date) and year(issue_date)=2021 ;  
-- *******************************
select sum(loan_amount) as MTD_Total_Funded_Amount from bank_loan_data where month(issue_date)=12 and year(issue_date)=2021;  
-- *******************************
select sum(loan_amount) as PMTD_Total_Funded_Amount from bank_loan_data where month(issue_date)=11 and year(issue_date)=2021;  
-- *******************************
select sum(total_payment) as MTD_Total_Amount_Received from bank_loan_data where month(issue_date)=12 and year(issue_date)=2021;
-- *******************************
select sum(total_payment) as MTD_Total_Amount_Received from bank_loan_data where month(issue_date)=11 and year(issue_date)=2021;
-- *******************************
select round(avg(int_rate)*100,2) as MTD_Average_Interest_Rate from bank_loan_data where month(issue_date)=12 and year(issue_date)=2021; 
-- *******************************
select round(avg(int_rate)*100,2) as PMTD_Average_Interest_Rate from bank_loan_data where month(issue_date)=11 and year(issue_date)=2021; 
-- *******************************
select round(avg(dti)*100,2) as MTD_Avg_DTI from bank_loan_data where month(issue_date)=12 and year(issue_date)=2021;
-- *******************************
select round(avg(dti)*100,2) as MTD_Avg_DTI from bank_loan_data where month(issue_date)=11 and year(issue_date)=2021;
-- *******************************
select (count(case when loan_status='Fully Paid' or loan_status='Current' then id end)*100)
/
count(id) as Good_Loan_Percentage
from bank_loan_data;
-- *******************************
select count(id) as Good_Loan_Application from bank_loan_data where loan_status='Fully Paid' or loan_status='Current';
-- *******************************
select sum(loan_amount) as Good_Loan_Funded_Amount from bank_loan_data where loan_status='Fully Paid' or loan_status='Current';
-- *******************************
select sum(total_payment) as Good_Loan_Receive_Amount from bank_loan_data where loan_status='Fully Paid' or loan_status='Current';
-- *******************************
select (count(case when loan_status='Charged Off' then id end)*100.0)
/
count(id) as Bad_Loan_Percentage
from bank_loan_data;
-- *******************************
select count(id) as Bad_Loan_Application from bank_loan_data where loan_status='Charged Off';
-- *******************************
select sum(loan_amount) as Bad_Loan_Funded_Amount from bank_loan_data where loan_status='Charged Off';
-- *******************************
select sum(total_payment) as Bad_Loan_Receive_Amount from bank_loan_data where loan_status='Charged Off';
-- *******************************
SELECT
    loan_status,
    COUNT(id) AS LoanCount,
    SUM(total_payment) AS Total_Amount_Received,
    SUM(loan_amount) AS Total_Funded_Amount,
    AVG(int_rate * 100) AS Interest_Rate,
    AVG(dti * 100) AS DTI
FROM
    bank_loan_data
GROUP BY
    loan_status;
-- *******************************
SELECT
    loan_status,
    SUM(total_payment) AS MTD_Total_Amount_Received,
    SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM bank_loan_data
    where month(issue_date)=12
GROUP BY   loan_status; 
 -- *******************************
SELECT 
    MONTH(issue_date) AS Month_Number,
    MONTHNAME(issue_date) AS Month_Name,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY MONTH(issue_date), MONTHNAME(issue_date)
ORDER BY Month_Number;

-- **********************************************
SELECT 
    address_state,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY address_state
ORDER BY COUNT(id) desc ;
-- **********************************************
SELECT 
    term,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY term
ORDER BY term ;
-- **********************************************
SELECT 
    emp_length,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY emp_length
ORDER BY COUNT(id) desc ;
-- **********************************************
SELECT 
    purpose,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY purpose
ORDER BY COUNT(id) desc ;
-- **********************************************
SELECT 
    home_ownership,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY COUNT(id) desc ;
-- **********************************************
SELECT 
    home_ownership,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
where grade='A'
GROUP BY home_ownership
ORDER BY COUNT(id) desc ;














