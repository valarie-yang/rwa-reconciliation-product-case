# RWA Investor Data & Reconciliation Product Case

A product case study for a tokenized short-duration Treasury-style investment product, focused on investor holdings, NAV, transactions, reconciliation, reporting and an AI-assisted data experience.

**Role lens:** Product Management  
**Focus:** RWA · Tokenization · NAV · Position · Reconciliation · Financial Data · AI Data Copilot  
**Artifacts:** Product model · Reconciliation flow · Data model · Exception handling · Proposed metrics

> This is a portfolio reconstruction using synthetic examples and publicly explainable product patterns. It contains no confidential company data and is not presented as a live regulated investment product.

## Product problem

Tokenized investment products create a new operational challenge: investors see on-chain balances, while operators may also rely on off-chain books, NAV calculations, subscription/redemption records and reporting systems. A useful product must make those sources consistent, traceable and explainable.

## MVP scope

The MVP intentionally narrows the system to one RWA asset and one EVM network so the core data and reconciliation logic can be validated before adding more issuers, chains or asset classes.

Core objects:

- Asset
- Investor
- Position
- NAV
- Transaction
- Reconciliation

Core modules:

- Asset overview
- Investor holdings / position
- NAV and return view
- Transaction history
- Reconciliation workspace
- Monthly reporting
- AI Data Copilot

## Core reconciliation model

```text
On-chain token events
        ↓
Normalized transaction records
        ↓
Investor / position ledger
        ↓
Compare with back-office records
        ↓
Matched / timing difference / amount difference / missing record
        ↓
Manual review + resolution
        ↓
Reconciled reporting version
```

## Key product decisions

1. **One source of truth is not enough** — chain data, operational records and NAV/reporting data can each be authoritative for different fields.
2. **Differences need classification** — not every mismatch is an error; timing, decimals, corporate actions, stale NAV or delayed indexing can create legitimate differences.
3. **Reconciliation is a workflow** — detect → classify → investigate → confirm → resolve → audit.
4. **Reporting must be versioned** — users need to know which data snapshot and calculation rules produced a report.
5. **AI must be traceable** — the AI Data Copilot should cite source data and calculation logic rather than produce unsupported financial explanations.

## Proposed AI Data Copilot

Example supported questions:

- "What is this investor's current position and latest NAV?"
- "Why does the on-chain balance differ from the back-office ledger?"
- "Summarize the reconciliation exceptions for this reporting period."

Guardrails:

- Retrieval from structured product data
- Citation of source records
- Explicit calculation logic
- No unsupported investment advice
- Human confirmation for unresolved differences

## Repository map

- [`docs/product-overview.md`](docs/product-overview.md) — users, scope and module definitions
- [`docs/data-model.md`](docs/data-model.md) — core entities and relationships
- [`docs/reconciliation-flow.md`](docs/reconciliation-flow.md) — operational reconciliation workflow
- [`docs/exception-taxonomy.md`](docs/exception-taxonomy.md) — difference classification
- [`docs/reporting-and-versioning.md`](docs/reporting-and-versioning.md) — report lineage and auditability
- [`docs/ai-data-copilot.md`](docs/ai-data-copilot.md) — source-grounded AI interaction model
- [`data/sample_transactions.csv`](data/sample_transactions.csv) — synthetic transaction sample
- [`sql/reconciliation-example.sql`](sql/reconciliation-example.sql) — example reconciliation query

## Portfolio connection

This case supports RWA, tokenization, institutional wallet, payments/settlement, financial-data and FinTech product applications. It is designed to connect prior institutional-finance data experience with Web3 product work.
