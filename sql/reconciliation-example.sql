-- Synthetic portfolio example: compare normalized on-chain and back-office balances.
-- This query is illustrative only; table and field names are portfolio constructs.

WITH chain_balance AS (
    SELECT
        investor_id,
        asset_id,
        SUM(CASE WHEN direction = 'IN' THEN units ELSE -units END) AS chain_units
    FROM onchain_transactions
    WHERE status = 'CONFIRMED'
    GROUP BY investor_id, asset_id
),
book_balance AS (
    SELECT
        investor_id,
        asset_id,
        SUM(units) AS book_units
    FROM backoffice_positions
    WHERE record_status = 'ACTIVE'
    GROUP BY investor_id, asset_id
)
SELECT
    COALESCE(c.investor_id, b.investor_id) AS investor_id,
    COALESCE(c.asset_id, b.asset_id) AS asset_id,
    COALESCE(c.chain_units, 0) AS chain_units,
    COALESCE(b.book_units, 0) AS book_units,
    COALESCE(c.chain_units, 0) - COALESCE(b.book_units, 0) AS difference_units,
    CASE
        WHEN c.investor_id IS NULL THEN 'MISSING_ON_CHAIN'
        WHEN b.investor_id IS NULL THEN 'MISSING_IN_BOOK'
        WHEN ABS(COALESCE(c.chain_units, 0) - COALESCE(b.book_units, 0)) < 0.000001 THEN 'MATCHED'
        ELSE 'AMOUNT_DIFFERENCE'
    END AS reconciliation_status
FROM chain_balance c
FULL OUTER JOIN book_balance b
    ON c.investor_id = b.investor_id
   AND c.asset_id = b.asset_id;
