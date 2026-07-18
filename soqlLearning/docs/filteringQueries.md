# Filtering Queries

---

## Method: [`getAllClosedWonOpp()`](../force-app/main/default/classes/queriesAggreRelationships.cls)

### Purpose

Retrieve all Opportunities whose **Stage** is **Closed Won**.

---

## Query

```sql
SELECT
    Id,
    Name,
    StageName,
    Amount,
    CloseDate
FROM Opportunity
WHERE StageName = 'Closed Won'
```

---

## Learning

### Filtering with `WHERE`

The `WHERE` clause filters records based on a specified condition.

In this example, we filter Opportunities whose **StageName** is **Closed Won**.

> **Important:** `StageName` is a **Picklist** field, so the value is **case-sensitive**.

✅ Correct

```sql
WHERE StageName = 'Closed Won'
```

❌ Incorrect

```sql
WHERE StageName = 'closed won'
```

```sql
WHERE StageName = 'Closed won'
```

Both of the above queries return **zero records** because the picklist value must exactly match the configured value.

---

## Opportunity Stage Reference

| StageName | IsClosed | IsWon | Meaning |
|-----------|:--------:|:-----:|---------|
| Prospecting | ❌ | ❌ | Early stage lead |
| Proposal/Price Quote | ❌ | ❌ | Quote has been shared |
| Closed Won | ✅ | ✅ | Deal successfully won |
| Closed Lost | ✅ | ❌ | Deal lost |

---

## Important Note

Filtering by

```sql
WHERE IsClosed = true
```

returns **both**:

- Closed Won
- Closed Lost

If you need **only won Opportunities**, filter using:

```sql
WHERE StageName = 'Closed Won'
```

---

## Key Takeaways

- Use the `WHERE` clause to filter records.
- `StageName` is a **picklist** field.
- Picklist values are **case-sensitive**.
- `IsClosed = true` includes both **Closed Won** and **Closed Lost**.
- Use `StageName = 'Closed Won'` when you specifically need won Opportunities.