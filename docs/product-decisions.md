# Product Decisions & Trade-offs

This document makes the case-study decisions explicit rather than presenting the product as a list of screens.

## Decision 1 — Start with one asset and one EVM network

**Alternative:** design multi-asset, multi-chain support from day one.

**Decision:** focus the MVP on one tokenized Treasury-style asset and one EVM network.

**Why:** reconciliation, valuation lineage, transaction normalization and reporting versioning create more operational risk than the number of supported chains. A narrow MVP makes those rules testable before scale adds more mapping and exception complexity.

**What would trigger expansion:** stable auto-match rates, controlled exception aging, reproducible reports and clear network/asset onboarding rules.

## Decision 2 — Treat reconciliation as a workflow, not a warning banner

**Alternative:** show a generic “balance mismatch” state.

**Decision:** model detect → classify → investigate → confirm → resolve → audit.

**Why:** timing differences, missing records, duplicate events and NAV-version differences require different owners and recovery actions. A single mismatch state is not operationally actionable.

## Decision 3 — Keep report lineage explicit

**Alternative:** display the latest number without preserving the inputs that produced it.

**Decision:** every published report should identify the position snapshot, NAV version, calculation-rule version and source-data version.

**Why:** financial outputs must remain explainable after source data or NAV is corrected.

## Decision 4 — AI explains; tools calculate

**Alternative:** allow the LLM to infer holdings, returns or reconciliation differences from narrative context.

**Decision:** structured tools retrieve positions/NAV/transactions; an explicit calculation layer computes figures; retrieval supplies definitions/rules; the LLM composes a cited explanation.

**Why:** this reduces unsupported arithmetic and makes financial answers auditable.

## Decision 5 — Human confirmation for unresolved material differences

**Alternative:** auto-adjust the book or report when an AI classifier predicts an exception category.

**Decision:** AI may recommend a category and next action, but unresolved material differences remain human-confirmed.

**Why:** the cost of a false automatic adjustment is higher than the cost of escalating a small subset of ambiguous cases.
