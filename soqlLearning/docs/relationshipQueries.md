# Relationship Queries

---

## Contact and Opportunity Relationship

### Understanding the Relationship

## Method: [`getContactsForSpecificOpp()`](../force-app/main/default/classes/queriesAggreRelationships.cls)

`Contact` and `Opportunity` are **not directly related** in Salesforce.

They are connected through the standard junction object **OpportunityContactRole**.

```text
Contact
    ▲
    │
OpportunityContactRole
    │
    ▼
Opportunity
```

Relationship Chain:

```text
Opportunity ─── OpportunityContactRole ─── Contact
```

---

## Approach 1 — Query from OpportunityContactRole (Most Common)

### Query

```sql
SELECT
    Contact.Name,
    Contact.Email,
    Role
FROM OpportunityContactRole
WHERE Opportunity.Name = 'XYZ Opportunity'
```

### When to Use

- When you need the **Role** of each Contact.
- When you want details from the `OpportunityContactRole` record.
- When the same Contact appearing multiple times is acceptable.

### Learning

- `OpportunityContactRole` is the junction object between `Opportunity` and `Contact`.
- Parent fields are accessed using dot notation (`Contact.Name`, `Opportunity.Name`).
- One Contact can have multiple OCR records, resulting in duplicate Contact rows.

---

## Approach 2 — Retrieve Unique Contacts

### Query

```sql
SELECT
    Name,
    Email
FROM Contact
WHERE Id IN (
    SELECT ContactId
    FROM OpportunityContactRole
    WHERE Opportunity.Name = 'XYZ Opportunity'
)
```

### When to Use

- When you only need unique Contact records.
- When OCR-specific fields (such as `Role`) are not required.
- When duplicate Contacts should be avoided.

### Learning

- Uses a **Semi-Join** (`IN (SELECT ...)`) to filter Contacts.
- Returns one row per Contact.
- Does not expose fields from `OpportunityContactRole`.

---

## Approach Comparison

| Approach | Query From | Returns | Best Use Case |
|-----------|------------|----------|---------------|
| Approach 1 | `OpportunityContactRole` | One row per OCR record | Need Contact Role or OCR details |
| Approach 2 | `Contact` | Unique Contact records | Need only Contacts without duplicates |

---

## Key Takeaways

- `Contact` and `Opportunity` do **not** have a direct relationship.
- `OpportunityContactRole` is the standard junction object connecting them.
- Query the junction object when relationship details (such as `Role`) are required.
- Use a **Semi-Join** (`IN (SELECT ...)`) to retrieve unique Contact records.