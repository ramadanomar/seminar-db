-- Seeding for products
INSERT INTO products (
        id,
        image,
        title,
        shopify_id,
        created_at,
        updated_at
    )
VALUES (
        'prod1',
        'image_url_1',
        'Product Title 1',
        'shopify1',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'prod2',
        'image_url_2',
        'Product Title 2',
        'shopify2',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    );
-- Seeding for product_variants
INSERT INTO product_variants (
        id,
        shopify_id,
        "size",
        product_id,
        created_at,
        updated_at
    )
VALUES (
        'var1',
        'shopify_var1',
        'M',
        'prod1',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'var2',
        'shopify_var2',
        'L',
        'prod2',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    );
-- Seeding for grns
INSERT INTO grns (
        id,
        purchase_order_id,
        stockx_order_id,
        created_at,
        updated_at
    )
VALUES (
        'grn1',
        'po1',
        'so1',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    );
-- Seeding for stockx_orders
INSERT INTO stockx_orders (id, stockx_id, grnId, created_at, updatedAt)
VALUES (
        'so1',
        'stockx1',
        'grn1',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    );
-- Seeding for stockx_order_details
INSERT INTO stockx_order_details (
        id,
        stockx_order_id,
        variant_id,
        quantity,
        created_at,
        updated_at
    )
VALUES (
        'sod1',
        'so1',
        'var1',
        5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    );
-- Seeding for purchase_orders
INSERT INTO purchase_orders (
        id,
        state,
        buyer_approved,
        seller_approved,
        buyer_approved_at,
        seller_approved_at,
        grn_id,
        created_at,
        updated_at
    )
VALUES (
        'po1',
        'APPROVED',
        1,
        1,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        'grn1',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    );
-- Seeding for purchase_order_details
INSERT INTO purchase_order_details (
        id,
        purchase_order_id,
        variant_id,
        quantity,
        created_at,
        updated_at
    )
VALUES (
        'pod1',
        'po1',
        'var2',
        10,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    );
-- Seeding for inventory_items
INSERT INTO inventory_items (
        id,
        state,
        notes,
        variant_id,
        grn_id,
        created_at,
        updated_at
    )
VALUES (
        'item1',
        'AVAILABLE',
        'Good condition',
        'var1',
        'grn1',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'item2',
        'COMMITTED',
        'New',
        'var2',
        'grn1',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    );