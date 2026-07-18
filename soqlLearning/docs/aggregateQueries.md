# Aggregate Queries

---

## Method: [`getTotalOppPerAcc()`](../force-app/main/default/classes/queriesAggreRelationships.cls)

### Purpose

Retrieve the total number of Opportunities for each Account and display the Accounts with the highest number of Opportunities first.

### Query

```sql
SELECT AccountId, Account.Name, COUNT(Id)
FROM Opportunity
GROUP BY AccountId, Account.Name
ORDER BY COUNT(Id) DESC
```

### Learning

| Clause | Purpose |
|--------|---------|
| `COUNT(Id)` | Counts total Opportunities for each Account. |
| `GROUP BY AccountId, Account.Name` | Required when using aggregate functions with non-aggregate fields. |
| `ORDER BY COUNT(Id) DESC` | Sorts Accounts by the highest Opportunity count. |

### Golden Rule

> Every non-aggregate field in the `SELECT` clause must also appear in the `GROUP BY` clause.

### Important Note

Use `HAVING` instead of `WHERE` when filtering aggregated results.

```sql
HAVING COUNT(Id) > 5
```