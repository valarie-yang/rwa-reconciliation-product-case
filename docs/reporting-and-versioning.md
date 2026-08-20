# Reporting & Versioning

This case assumes an MVP for a tokenized short-duration Treasury-style asset, using synthetic/public examples.

## Reporting goals

A monthly investor report should be reproducible from a known data cut-off and should preserve the calculation basis used at the time it was issued.

Recommended report contents:
- investor identifier;
- wallet / account reference;
- opening units;
- subscriptions / redemptions / transfers;
- closing units;
- applicable NAV;
- market value;
- period return / accrued yield;
- unresolved reconciliation exceptions;
- source timestamp and reporting cut-off.

## Version model

Each generated report should have:

```text
report_id
report_version
period_start
period_end
cutoff_timestamp
nav_version
position_snapshot_id
reconciliation_run_id
status
created_at
approved_at
```

Suggested statuses:

`DRAFT → REVIEWED → APPROVED → ISSUED`

If material data changes after issuance, create a new version instead of overwriting the old one.

## Why versioning matters

A financial report may be reproduced or challenged later. The product therefore needs to answer:

- Which NAV did we use?
- Which position snapshot did we use?
- Which reconciliation run was complete at the time?
- Were any exceptions still open?
- Who approved the issued version?

## Exception handling

A report may be:
- blocked by a high-severity unresolved difference;
- issued with a disclosed temporary difference under an approved rule;
- regenerated after an exception is resolved.

## Product principle

**Auditability is part of the user experience.** A correct number without provenance is weaker than a number that can be traced to its data source, calculation rule and version.
