# Product Overview

## Product concept

An investor data and reconciliation product for a tokenized short-duration Treasury-style asset. The product brings together investor positions, NAV, transactions, on-chain token events, back-office records and reporting workflows.

This portfolio case intentionally uses **synthetic data and a reconstructed product model**. It demonstrates product thinking rather than representing a live regulated investment product.

## Primary users

### Investor / client-facing operations
Needs a clear view of holdings, NAV, transaction history and report status.

### Operations / reconciliation analyst
Needs to detect, classify, investigate and resolve differences between on-chain and back-office records.

### Product / finance stakeholder
Needs traceable data definitions, reporting versions and measurable operational quality.

## MVP scope

The MVP focuses on:
- one tokenized RWA asset;
- one EVM network;
- public or synthetic transaction/NAV examples;
- a core reconciliation workflow before multi-chain or multi-issuer expansion.

## Core modules

1. **Asset Overview** — NAV, yield, valuation date and fund-level summary.
2. **Investor Position** — units, applicable NAV, market value and return.
3. **Transactions** — subscription, redemption and transfer lifecycle.
4. **Reconciliation Workspace** — chain vs. book comparison and exception handling.
5. **Reporting** — versioned monthly reports with data cut-off and calculation provenance.
6. **AI Data Copilot** — natural-language queries over structured financial data with citations and explicit calculation logic.

## Product principles

- Separate chain confirmation from operational posting status.
- Preserve provenance for NAV, position snapshots and reports.
- Treat reconciliation as a workflow, not a binary matching check.
- Distinguish temporary timing differences from true exceptions.
- Keep AI explanations source-grounded and reviewable.

## Out of scope for this MVP

- KYC/AML workflow implementation;
- transfer-agent or custodian integrations;
- multi-chain routing;
- primary issuance legal workflow;
- live investment advice;
- production custody or settlement infrastructure.

These would be logical expansion areas after validating the core data and reconciliation model.
