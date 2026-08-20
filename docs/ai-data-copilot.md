# AI Data Copilot for RWA Operations

The AI Data Copilot is designed as a **retrieval-and-explanation layer over structured financial data**, not as a source of record.

## Jobs to be done

Example user questions:
- “What is this investor's latest position?”
- “Why does the on-chain balance differ from the back-office position?”
- “Which reconciliation exceptions are still unresolved?”
- “Summarize this month's NAV and transaction changes.”

## Product architecture

```text
User question
   ↓
Intent / entity resolution
   ↓
Authorized data retrieval
   ├─ Investor / Position
   ├─ NAV
   ├─ Transaction
   └─ Reconciliation / Exceptions
   ↓
Calculation / business-rule layer
   ↓
LLM explanation
   ↓
Answer + cited records + calculation logic
```

## Guardrails

### 1. Source-grounded answers
Every material number should be traceable to a retrieved record or deterministic calculation.

### 2. Separate retrieval from calculation
The language model should not invent NAV, yield or reconciliation amounts. Calculations should be produced by explicit rules or tools and then explained.

### 3. Permission-aware retrieval
Investor and transaction data should respect user permissions before any content reaches the model context.

### 4. Uncertainty handling
If source records conflict or data is incomplete, the assistant should expose the uncertainty instead of silently choosing one value.

### 5. Human-in-the-loop resolution
The copilot may explain a reconciliation difference, but manual adjustments or accounting-resolution actions require explicit authorized confirmation.

## Example answer pattern

**Question:** Why is Investor A off by 250 units?

**Answer structure:**
1. State the observed difference.
2. Cite the on-chain record and back-office record.
3. Explain the likely exception category.
4. Show the relevant cut-off / transaction timestamp.
5. Recommend the next operational action.
6. Avoid changing any source record automatically.

## Evaluation ideas

- factual accuracy against structured records;
- calculation accuracy;
- citation completeness;
- correct exception classification;
- unsupported-claim rate;
- escalation accuracy;
- user time saved in investigation workflows.

This is a product concept within the portfolio reconstruction and does not claim a production LLM deployment.
