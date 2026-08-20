# RWA Product Data Model

The MVP is organized around six product objects. The purpose is not to model every legal or operational entity in a real fund structure, but to make investor holdings, NAV, transactions and reconciliation traceable.

## 1. Asset

Represents the tokenized investment product.

Example fields:
- asset_id
- asset_name
- token_contract
- network
- currency
- issuer_reference
- valuation_frequency
- status

## 2. Investor

Represents an investor profile in the product layer.

Example fields:
- investor_id
- wallet_address
- account_reference
- eligibility_status
- reporting_currency

## 3. Position

Represents the investor's economic holding at a point in time.

Example fields:
- position_id
- investor_id
- asset_id
- token_balance
- units
- latest_nav
- market_value
- as_of_time
- source

## 4. NAV

Represents the valuation record used for holdings and reporting.

Example fields:
- asset_id
- nav_per_unit
- valuation_date
- published_at
- source_reference
- version

## 5. Transaction

Normalizes both on-chain and operational transaction events.

Example fields:
- transaction_id
- investor_id
- asset_id
- transaction_type
- direction
- units
- amount
- tx_hash
- chain_timestamp
- book_timestamp
- status
- source

## 6. Reconciliation

Represents the comparison and resolution workflow between sources.

Example fields:
- reconciliation_id
- investor_id
- asset_id
- reporting_period
- chain_balance
- book_balance
- difference_amount
- difference_type
- investigation_status
- resolution_note
- reviewer
- resolved_at

## Relationships

```text
Investor ──< Position >── Asset
   │                     │
   └──< Transaction >────┘
             │
             └── Reconciliation

Asset ──< NAV
```

## Product design note

`Position` is derived product state. It should not be treated as a raw source record. A user-facing position may depend on token balance, operational records, the latest valid NAV and a specific reporting timestamp.

This distinction matters because the product can show a technically correct chain balance while still being unable to produce a final reconciled reporting value.
