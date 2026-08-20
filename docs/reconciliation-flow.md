# RWA Reconciliation Flow

Reconciliation is designed as a product workflow rather than a binary balance check.

## Sources

The MVP compares three product-relevant sources:

1. **On-chain records** — token Transfer events, wallet balances and transaction hashes.
2. **Operational / back-office records** — subscription, redemption and position records maintained outside the chain.
3. **Valuation / reporting records** — NAV and reporting snapshots used to calculate investor value.

## Workflow

```text
Ingest source records
      ↓
Normalize identifiers, timestamps and units
      ↓
Match by investor + asset + transaction / period
      ↓
Compare balances / units / amounts
      ↓
┌───────────────┬──────────────────┐
│ Matched       │ Difference       │
└───────────────┴──────────────────┘
                         ↓
                  Classify difference
                         ↓
          Timing / Amount / Missing / Data quality
                         ↓
                    Investigate
                         ↓
              Confirm / Adjust / Escalate
                         ↓
                 Resolution recorded
                         ↓
             Reconciled reporting version
```

## Difference taxonomy

### Timing difference
The same economic event exists in both systems but is recorded at different times.

Examples:
- chain confirmed before the operational book updates;
- indexer delay;
- reporting cut-off occurs before a late transaction is reflected.

### Amount / unit difference
Both sides contain the event but values differ.

Possible causes:
- decimal normalization;
- fee treatment;
- stale NAV;
- incorrect quantity;
- manual booking error.

### Missing chain record
An operational record exists but no expected chain event can be matched.

### Missing operational record
A chain event exists but no internal record can be matched.

### Identity / mapping difference
Wallet, account or asset identifiers cannot be reliably linked.

## Resolution states

- `Open`
- `Investigating`
- `Awaiting confirmation`
- `Resolved — timing`
- `Resolved — corrected`
- `Resolved — accepted difference`
- `Escalated`

## Product requirements

- Preserve the original source values during investigation.
- Show source timestamps and the reporting cut-off clearly.
- Keep an audit trail for manual decisions.
- Never silently overwrite a mismatch.
- Reporting versions should reference the reconciliation status used to generate them.

## Why this matters for users

For investors, the goal is not to expose operational complexity. The user-facing product should translate reconciliation into clear states such as:

- Position current
- Position updating
- Data under review
- Reporting finalized

Operations users, however, need the detailed difference classification and evidence behind each state.
