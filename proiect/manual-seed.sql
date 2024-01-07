INSERT INTO products (id, image, title, shopify_id, created_at, updated_at)
VALUES ('d1c20bc1-b40e-44c5-a927-2441dcbaa887', 'image_url_2', 'Example Product 2', 'gid://81935435331', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO products (id, image, title, shopify_id, created_at, updated_at)
VALUES ('f4b7990e-31fc-4c83-a8fa-f4857f6a64bf', 'image_url_2', 'Example Product 2', 'gid://12934853241', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO products (id, image, title, shopify_id, created_at, updated_at)
VALUES ('7e3bdc8c-4b97-43e0-8d93-aab4b29dbf5b', 'image_url_3', 'Example Product 3', 'gid://29451256331', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO product_variants (id, shopify_id, "size", product_id, created_at, updated_at)
VALUES ('uuid-variant-1', 'shopify_variant_1', 'M', '17cabf1d-b4c0-4e15-a110-b9f7a266cafe', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO product_variants (id, shopify_id, "size", product_id, created_at, updated_at)
VALUES ('uuid-variant-2', 'shopify_variant_2', 'L', 'f4b7990e-31fc-4c83-a8fa-f4857f6a64bf', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO product_variants (id, shopify_id, "size", product_id, created_at, updated_at)
VALUES ('uuid-variant-3', 'shopify_variant_3', 'S', '7e3bdc8c-4b97-43e0-8d93-aab4b29dbf5b', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO grns (id, purchase_order_id, stockx_order_id, created_at, updated_at)
VALUES ('uuid-grn-1', NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO stockx_orders (id, stockx_id, grnId, created_at, updatedAt)
VALUES ('uuid-stockx-order-1', 'stockx-unique-id-1', 'uuid-grn-1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO stockx_order_details (id, stockx_order_id, variant_id, quantity, created_at, updated_at)
VALUES ('uuid-stockx-order-detail-1', 'uuid-stockx-order-1', 'uuid-variant-1', 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO purchase_orders (id, state, buyer_approved, seller_approved, buyer_approved_at, seller_approved_at, grn_id, created_at, updated_at)
VALUES ('uuid-purchase-order-1', 'APPROVED', 1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'uuid-grn-1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO purchase_order_details (id, purchase_order_id, variant_id, quantity, created_at, updated_at)
VALUES ('uuid-purchase-order-detail-1', 'uuid-purchase-order-1', 'uuid-variant-2', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO inventory_items (id, state, notes, variant_id, grn_id, created_at, updated_at)
VALUES ('uuid-inventory-item-1', 'AVAILABLE', 'Item in good condition', 'uuid-variant-1', 'uuid-grn-1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO inventory_items (id, state, notes, variant_id, grn_id, created_at, updated_at)
VALUES ('uuid-inventory-item-2', 'COMMITTED', 'Brand new item', 'uuid-variant-2', 'uuid-grn-1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO inventory_items (id, state, notes, variant_id, grn_id, created_at, updated_at)
VALUES ('uuid-inventory-item-3', 'UNAVAILABLE', 'Currently out of stock', 'uuid-variant-3', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);