# UPI Transaction Intelligence – Business Insights

## 1. Overall Transaction Performance
- Total Transactions: 100,000
- Successful Transactions: 84,955
- Failed Transactions: 10,036
- Pending Transactions: 5,009
- Success Rate: 84.96%
- Failure Rate: 10.04%

**Business Insight:** Approximately 15% of transaction attempts did not reach successful status, indicating an opportunity to improve payment reliability.

## 2. Payment Failure Analysis
- Bank Server Error: 3,512 failures
- Network Error: 2,379 failures
- Insufficient Balance: 2,053 failures
- Incorrect UPI PIN: 1,584 failures
- Transaction Limit Exceeded: 508 failures

**Business Insight:** Bank Server Errors are the largest failure category. Improving bank-side reliability could be an important area of investigation.

## 3. Payment App Performance
- Paytm has the highest success rate at 85.16%.
- Google Pay has the lowest success rate at 84.72%.
- Google Pay also has the highest failure rate at 10.19%.

**Business Insight:** The synthetic dataset shows small differences in payment app performance. These results should not be interpreted as actual market performance.

## 4. Transaction Timing Analysis
- 10 AM recorded the highest transaction volume with 4,306 transactions.
- 11 PM recorded the lowest transaction volume with 4,017 transactions.

**Business Insight:** Transaction activity varies by hour. Payment platforms could examine peak-hour infrastructure capacity and monitoring.

## 5. Monthly Transaction Trends
- July recorded the highest monthly transaction volume: 8,605.
- February recorded the lowest monthly transaction volume: 7,682.
- December recorded the highest success rate: 86.09%.
- August recorded the lowest success rate: 84.25%.

**Business Insight:** Monthly transaction volume and success rate do not necessarily move together. Both metrics should be monitored independently.

---

**Dataset Disclaimer:** All findings are based on a synthetic dataset created for educational and portfolio purposes. They do not represent actual UPI industry or company performance.

## 6. City-wise Transaction Analysis
- Bareilly recorded the highest transaction volume: 14,185 transactions.
- Bengaluru recorded the lowest transaction volume: 6,821 transactions.
- Bareilly's transaction failure rate was 10.46%.

**Business Insight:** Transaction volumes vary across cities. Payment providers can investigate regional usage patterns and service reliability.

## 7. Bank Performance Analysis
- Kotak recorded the highest sender-bank failure rate: 10.36%.
- Axis recorded the lowest sender-bank failure rate: 9.58%.
- Union Bank recorded the highest successful transaction value: ₹22,269,475.

**Business Insight:** Bank-level performance monitoring can help identify institutions that may require further investigation into transaction failures.

## 8. Merchant Category Analysis
- Utilities recorded the highest transaction volume: 8,351.
- Travel recorded the highest successful transaction value: ₹18,396,306.
- Food recorded the highest number of failed transactions: 882.

**Business Insight:** Merchant categories show different transaction patterns. Payment platforms can monitor category-level payment reliability and transaction value.

## 9. P2P vs P2M Analysis
- P2P transactions: 50,148.
- P2M transactions: 49,852.
- P2P success rate: 84.96%.
- P2M success rate: 84.95%.

**Business Insight:** Both transaction types show nearly identical success rates in this synthetic dataset.

## 10. Processing Time and Customer Behaviour
- Average processing time for successful transactions: 5,232.98 ms.
- Average processing time for failed transactions: 5,263.55 ms.
- All 100 generated customers have multiple transactions.

**Business Insight:** Failed transactions have a slightly higher average processing time in this dataset. This is an observed association, not evidence of causation. The 100% repeat-customer result is a limitation of the synthetic data generation design.

---

## Final Conclusion

The analysis highlights transaction reliability, bank-level performance, payment failure reasons, merchant category trends, city-wise transaction activity and customer behaviour.

The findings can help demonstrate how SQL, Python and Power BI can be used together to investigate payment analytics problems.

**Dataset Disclaimer:** All findings are based on a synthetic dataset created for educational and portfolio purposes. They do not represent actual UPI industry or company performance. Failed and pending transaction values represent attempted transaction amounts, not confirmed financial losses.