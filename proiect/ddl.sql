-- Create Tables
CREATE TABLE inventory_items (
    id CHAR(36) PRIMARY KEY,
    state VARCHAR2(20) CHECK (
        state IN (
            'AVAILABLE',
            'COMMITTED',
            'UNAVAILABLE',
            'INCOMING',
            'NEEDED'
        )
    ),
    notes VARCHAR2(4000),
    variant_id CHAR(36) NOT NULL,
    grn_id CHAR(36),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);


-- NIR uri in engleza
CREATE TABLE grns (
    id CHAR(36) PRIMARY KEY,
    purchase_order_id CHAR(36),
    stockx_order_id CHAR(36),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE stockx_orders (
    id CHAR(36) PRIMARY KEY,
    stockx_id CHAR(36) UNIQUE,
    grnId CHAR(36),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP
);

CREATE TABLE stockx_order_details (
    id CHAR(36) PRIMARY KEY,
    stockx_order_id CHAR(36) NOT NULL,
    variant_id CHAR(36) NOT NULL,
    quantity NUMBER(10) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE purchase_orders (
    id CHAR(36) PRIMARY KEY,
    state VARCHAR2(20) CHECK (
        state IN (
            'AWAITING_APPROVAL',
            'APPROVED',
            'SHIPPED',
            'AWAITING_PAYMENT',
            'FINISHED',
            'CANCELLED'
        )
    ),
    buyer_approved NUMBER(1) DEFAULT 0,
    seller_approved NUMBER(1) DEFAULT 0,
    buyer_approved_at TIMESTAMP,
    seller_approved_at TIMESTAMP,
    grn_id CHAR(36),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE purchase_order_details (
    id CHAR(36) PRIMARY KEY,
    purchase_order_id CHAR(36) NOT NULL,
    variant_id CHAR(36) NOT NULL,
    quantity NUMBER(10) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE products (
    id CHAR(36) PRIMARY KEY,
    image VARCHAR2(4000),
    title VARCHAR2(4000) NOT NULL,
    shopify_id CHAR(36) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE product_variants (
    id CHAR(36) PRIMARY KEY,
    shopify_id CHAR(36) NOT NULL UNIQUE,
    "size" VARCHAR2(50) NOT NULL,
    product_id CHAR(36),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

-- Foreign Key Constraints
ALTER TABLE inventory_items
ADD CONSTRAINT inventory_items_variant_id_fkey FOREIGN KEY (variant_id) REFERENCES product_variants(id);
ALTER TABLE inventory_items
ADD CONSTRAINT inventory_items_grn_id_fkey FOREIGN KEY (grn_id) REFERENCES grns(id);

ALTER TABLE stockx_orders
ADD CONSTRAINT stockx_orders_grnId_fkey FOREIGN KEY (grnId) REFERENCES grns(id);

ALTER TABLE stockx_order_details
ADD CONSTRAINT stockx_order_details_stockx_order_id_fkey FOREIGN KEY (stockx_order_id) REFERENCES stockx_orders(id);
ALTER TABLE stockx_order_details
ADD CONSTRAINT stockx_order_details_variant_id_fkey FOREIGN KEY (variant_id) REFERENCES product_variants(id);

ALTER TABLE purchase_orders
ADD CONSTRAINT purchase_orders_grn_id_fkey FOREIGN KEY (grn_id) REFERENCES grns(id);

ALTER TABLE purchase_order_details
ADD CONSTRAINT purchase_order_details_purchase_order_id_fkey FOREIGN KEY (purchase_order_id) REFERENCES purchase_orders(id);
ALTER TABLE purchase_order_details
ADD CONSTRAINT purchase_order_details_variant_id_fkey FOREIGN KEY (variant_id) REFERENCES product_variants(id);

ALTER TABLE product_variants
ADD CONSTRAINT product_variants_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);