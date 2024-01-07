--- Inv items with all stock
SELECT p.title,
    COUNT(ii.id) AS available_inventory
FROM products p
    JOIN product_variants pv ON p.id = pv.product_id
    JOIN inventory_items ii ON pv.id = ii.variant_id
WHERE ii.state = 'AVAILABLE'
GROUP BY p.title;
--- Purchase Orders Awaiting Approval with Their Total Quantity
SELECT po.id,
    (
        SELECT SUM(quantity)
        FROM purchase_order_details
        WHERE purchase_order_id = po.id
    ) AS total_quantity
FROM purchase_orders po
WHERE po.state = 'AWAITING_APPROVAL';
--- List Purchased orders with state SHIPPED and updated_at in the current week
SELECT id,
    updated_at
FROM purchase_orders
WHERE state = 'SHIPPED'
    AND updated_at >= TRUNC(SYSDATE, 'IW');
-- Update PO Status
UPDATE purchase_orders
SET buyer_approved = 1,
    buyer_approved_at = CURRENT_TIMESTAMP
WHERE id = 'specific_purchase_order_id'
    AND state = 'AWAITING_APPROVAL';