# RWA Investor Data & Reconciliation Product Case

A product case study for a tokenized short-duration Treasury-style investment product, focused on investor holdings, NAV, transactions, reconciliation, reporting and an AI-assisted data experience.

**Role lens:** Product Management  
**Focus:** RWA · Tokenization · NAV · Position · Reconciliation · Financial Data · AI Data Copilot  
**Artifacts:** Product model · Reconciliation flow · Data model · Exception handling · Proposed metrics

> This is a portfolio reconstruction using synthetic examples and publicly explainable product patterns. It contains no confidential company data and is not presented as a live regulated investment product.

## My role and scope

**PM scope represented in this case:** product requirements, investor/position/NAV data modeling, transaction and reconciliation workflows, exception taxonomy, reporting lineage, AI-assistant interaction design, product metrics and UAT thinking.

**Implementation boundary:** this case does not claim ownership of fund administration, custody operations, regulated investment advice, smart-contract engineering or production NAV calculation infrastructure.

## Product problem

Tokenized investment products create a multi-source operating problem: investors see on-chain balances, while operators may rely on off-chain books, NAV calculations, subscription/redemption records and reporting systems. A useful product must make those sources consistent, traceable and explainable.

## MVP scope

The MVP intentionally focuses on one RWA asset and one EVM network so the core data and reconciliation logic can be validated before adding more issuers, chains or asset classes.

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

## Key product trade-offs

1. **Breadth vs. validation depth** — start with one asset and one EVM network to prove data lineage, reconciliation and reporting rules before multi-chain expansion.
2. **Automation vs. operational control** — auto-match clear cases, but route material or ambiguous differences into an auditable human-resolution workflow.
3. **Current answer vs. reproducible answer** — holdings and reports should identify the NAV version, source snapshot and calculation rule that produced the number.
4. **AI convenience vs. financial traceability** — the Copilot can explain and summarize, but calculations should come from explicit tools/rules and unresolved differences should remain human-confirmed.

## Key product decisions

- Chain data, operational records and NAV/reporting data can each be authoritative for different fields; no single source should silently override the others.
- Not every mismatch is an error. Timing, decimals, stale NAV or delayed indexing can create legitimate differences that need classification.
- Reconciliation is a workflow: detect → classify → investigate → confirm → resolve → audit.
- Reporting must be versioned so users can reproduce which data snapshot and rules generated an output.
- AI responses should cite source records and calculation logic rather than produce unsupported financial explanations.

## Proposed AI Data Copilot

Example supported questions:

- “What is this investor's current position and latest NAV?”
- “Why does the on-chain balance differ from the back-office ledger?”
- “Summarize the reconciliation exceptions for this reporting period.”

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
- [`docs/product-decisions.md`](docs/product-decisions.md) — MVP and trade-off rationale
- [`data/sample_transactions.csv`](data/sample_transactions.csv) — synthetic transaction sample
- [`sql/reconciliation-example.sql`](sql/reconciliation-example.sql) — example reconciliation query

## Portfolio connection

This is a flagship case for RWA, tokenization, institutional wallet, payments/settlement, financial-data and FinTech product applications. It connects institutional-finance data and reconciliation experience with on-chain product design.
