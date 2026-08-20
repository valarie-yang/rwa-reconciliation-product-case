# RWA Reconciliation Exception Taxonomy

A reconciliation workflow is useful only when differences are categorized into actionable exception types rather than shown as a single mismatch amount.

| Exception type | Example | Likely owner | Product action |
|---|---|---|---|
| Timing difference | Chain transfer confirmed after reporting cut-off | Ops / Data | Mark temporary; auto-recheck next cycle |
| Missing back-office record | On-chain subscription exists but book transaction is absent | Operations | Create investigation task |
| Missing on-chain event | Book subscription exists but token mint/transfer not observed | Product / Engineering | Verify transaction status and source system |
| Quantity mismatch | Token units differ from internal position units | Ops / Finance | Compare transaction history and adjustment entries |
| Valuation mismatch | Position units match but reported value differs | Finance / NAV | Validate NAV date, price source and valuation rule |
| Duplicate record | Same transaction appears more than once in one source | Data / Engineering | De-duplicate and preserve audit trail |
| Mapping error | Wallet/account mapped to wrong investor | Operations | Correct mapping with approval and audit log |
| Manual adjustment | Back-office adjustment intentionally differs from chain record | Finance / Ops | Require reason, approver and versioned evidence |

## Exception lifecycle

```text
DETECTED
  ↓
CLASSIFIED
  ↓
ASSIGNED
  ↓
INVESTIGATING
  ├─→ RESOLVED_AUTOMATICALLY
  ├─→ RESOLVED_MANUALLY
  └─→ ESCALATED
  ↓
CLOSED
```

## Product requirements

Each exception should preserve:
- source records from both sides;
- difference amount and unit;
- classification;
- owner;
- timestamps;
- investigation notes;
- resolution reason;
- approver where required;
- report/version impact.

## Principle

The goal is not just to make two numbers equal. The system should explain **why** they differed, who resolved the difference, and what evidence supports the final state.
