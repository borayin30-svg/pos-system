CREATE TABLE IF NOT EXISTS `users` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `username` VARCHAR(255) UNIQUE NOT NULL,
  `email` VARCHAR(255) UNIQUE NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(255),
  `last_name` VARCHAR(255),
  `phone` VARCHAR(20),
  `profile_image` VARCHAR(255),
  `role_id` INT NOT NULL,
  `branch_id` INT,
  `is_active` TINYINT DEFAULT 1,
  `last_login` DATETIME,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `roles` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `slug` VARCHAR(255) UNIQUE NOT NULL,
  `description` TEXT,
  `is_system` TINYINT DEFAULT 0,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `slug` VARCHAR(255) UNIQUE NOT NULL,
  `group` VARCHAR(100),
  `description` TEXT,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `role_permissions` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `role_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`permission_id`) REFERENCES `permissions`(`id`) ON DELETE CASCADE,
  UNIQUE KEY `unique_role_permission` (`role_id`, `permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `branches` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `code` VARCHAR(50) UNIQUE NOT NULL,
  `address` TEXT,
  `phone` VARCHAR(20),
  `email` VARCHAR(255),
  `manager_id` INT,
  `is_active` TINYINT DEFAULT 1,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `slug` VARCHAR(255) UNIQUE NOT NULL,
  `description` TEXT,
  `parent_id` INT,
  `icon` VARCHAR(255),
  `is_active` TINYINT DEFAULT 1,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`parent_id`) REFERENCES `product_categories`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `brands` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL UNIQUE,
  `slug` VARCHAR(255) UNIQUE NOT NULL,
  `description` TEXT,
  `logo` VARCHAR(255),
  `is_active` TINYINT DEFAULT 1,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `units` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL UNIQUE,
  `symbol` VARCHAR(10),
  `description` TEXT,
  `is_active` TINYINT DEFAULT 1,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `products` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `sku` VARCHAR(100) UNIQUE NOT NULL,
  `barcode` VARCHAR(255),
  `description` LONGTEXT,
  `category_id` INT,
  `brand_id` INT,
  `unit_id` INT,
  `cost_price` DECIMAL(15,2) DEFAULT 0.00,
  `selling_price` DECIMAL(15,2) NOT NULL,
  `quantity_in_stock` INT DEFAULT 0,
  `reorder_level` INT DEFAULT 10,
  `image_url` VARCHAR(255),
  `is_active` TINYINT DEFAULT 1,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`category_id`) REFERENCES `product_categories`(`id`) ON DELETE SET NULL,
  FOREIGN KEY (`brand_id`) REFERENCES `brands`(`id`) ON DELETE SET NULL,
  FOREIGN KEY (`unit_id`) REFERENCES `units`(`id`) ON DELETE SET NULL,
  INDEX `idx_sku` (`sku`),
  INDEX `idx_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `customers` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(20),
  `email` VARCHAR(255),
  `address` TEXT,
  `loyalty_tier` ENUM('bronze', 'silver', 'gold', 'platinum') DEFAULT 'bronze',
  `wallet_balance` DECIMAL(15,2) DEFAULT 0.00,
  `loyalty_points` INT DEFAULT 0,
  `credit_limit` DECIMAL(15,2) DEFAULT 0.00,
  `total_purchases` DECIMAL(15,2) DEFAULT 0.00,
  `is_active` TINYINT DEFAULT 1,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX `idx_phone` (`phone`),
  INDEX `idx_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `warehouses` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `code` VARCHAR(50) UNIQUE NOT NULL,
  `location` VARCHAR(255),
  `manager_id` INT,
  `is_active` TINYINT DEFAULT 1,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `product_warehouse` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `warehouse_id` INT NOT NULL,
  `quantity` INT DEFAULT 0,
  `reserved_quantity` INT DEFAULT 0,
  `reorder_level` INT DEFAULT 10,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses`(`id`) ON DELETE CASCADE,
  UNIQUE KEY `unique_product_warehouse` (`product_id`, `warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `sales` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `receipt_number` VARCHAR(50) UNIQUE NOT NULL,
  `customer_id` INT,
  `cashier_id` INT NOT NULL,
  `branch_id` INT,
  `subtotal` DECIMAL(15,2) DEFAULT 0.00,
  `tax_amount` DECIMAL(15,2) DEFAULT 0.00,
  `discount_amount` DECIMAL(15,2) DEFAULT 0.00,
  `total_amount` DECIMAL(15,2) NOT NULL,
  `payment_status` ENUM('pending', 'paid', 'partial', 'refunded') DEFAULT 'pending',
  `sale_status` ENUM('completed', 'cancelled', 'pending') DEFAULT 'pending',
  `notes` TEXT,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`) ON DELETE SET NULL,
  FOREIGN KEY (`cashier_id`) REFERENCES `users`(`id`),
  FOREIGN KEY (`branch_id`) REFERENCES `branches`(`id`) ON DELETE SET NULL,
  INDEX `idx_receipt` (`receipt_number`),
  INDEX `idx_date` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `sale_items` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `sale_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `unit_price` DECIMAL(15,2) NOT NULL,
  `discount_percent` DECIMAL(5,2) DEFAULT 0.00,
  `discount_amount` DECIMAL(15,2) DEFAULT 0.00,
  `line_total` DECIMAL(15,2) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`sale_id`) REFERENCES `sales`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`product_id`) REFERENCES `products`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `payments` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `sale_id` INT NOT NULL,
  `payment_method` ENUM('cash', 'card', 'wallet', 'cheque', 'bank_transfer') NOT NULL,
  `amount` DECIMAL(15,2) NOT NULL,
  `reference` VARCHAR(255),
  `status` ENUM('pending', 'confirmed', 'failed') DEFAULT 'pending',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`sale_id`) REFERENCES `sales`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `activity_logs` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT,
  `action` VARCHAR(255) NOT NULL,
  `module` VARCHAR(100),
  `description` TEXT,
  `ip_address` VARCHAR(45),
  `user_agent` TEXT,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE SET NULL,
  INDEX `idx_user` (`user_id`),
  INDEX `idx_date` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `settings` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `key` VARCHAR(255) UNIQUE NOT NULL,
  `value` LONGTEXT,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `school_subjects` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `code` VARCHAR(50),
  `max_score` DECIMAL(10,2) DEFAULT 100.00,
  `pass_score` DECIMAL(10,2) DEFAULT 50.00,
  `program_type` ENUM('main', 'english') DEFAULT 'main',
  `is_active` TINYINT DEFAULT 1,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `class_levels` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `level_number` INT,
  `academic_year` INT,
  `monthly_fee` DECIMAL(10,2) DEFAULT 0.00,
  `is_active` TINYINT DEFAULT 1,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `school_classes` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `level_id` INT NOT NULL,
  `homeroom_teacher_id` INT,
  `room_number` VARCHAR(50),
  `capacity` INT DEFAULT 40,
  `is_active` TINYINT DEFAULT 1,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`level_id`) REFERENCES `class_levels`(`id`),
  FOREIGN KEY (`homeroom_teacher_id`) REFERENCES `users`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `students` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `date_of_birth` DATE,
  `gender` ENUM('M', 'F') DEFAULT 'M',
  `student_id` VARCHAR(50) UNIQUE,
  `class_id` INT NOT NULL,
  `photo_url` VARCHAR(255),
  `parent_name` VARCHAR(255),
  `parent_phone` VARCHAR(20),
  `parent_email` VARCHAR(255),
  `enrollment_type` ENUM('full-time', 'part-time') DEFAULT 'full-time',
  `enrollment_date` DATE,
  `is_active` TINYINT DEFAULT 1,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`class_id`) REFERENCES `school_classes`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `attendances` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `student_id` INT NOT NULL,
  `class_id` INT NOT NULL,
  `attendance_date` DATE NOT NULL,
  `status` ENUM('P', 'A', 'L', 'PM') DEFAULT 'P',
  `program_type` ENUM('main', 'english') DEFAULT 'main',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`student_id`) REFERENCES `students`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`class_id`) REFERENCES `school_classes`(`id`) ON DELETE CASCADE,
  UNIQUE KEY `unique_attendance` (`student_id`, `class_id`, `attendance_date`, `program_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `exam_types` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `code` VARCHAR(50),
  `weight` DECIMAL(5,2) DEFAULT 1.00,
  `is_active` TINYINT DEFAULT 1,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `student_scores` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `student_id` INT NOT NULL,
  `subject_id` INT NOT NULL,
  `exam_type_id` INT NOT NULL,
  `score` DECIMAL(10,2) NOT NULL,
  `max_score` DECIMAL(10,2) DEFAULT 100.00,
  `is_pass` TINYINT DEFAULT 1,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`student_id`) REFERENCES `students`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`subject_id`) REFERENCES `school_subjects`(`id`),
  FOREIGN KEY (`exam_type_id`) REFERENCES `exam_types`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `fee_types` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `amount` DECIMAL(15,2) NOT NULL,
  `frequency` ENUM('monthly', 'annual', 'quarterly') DEFAULT 'monthly',
  `is_active` TINYINT DEFAULT 1,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `fee_collections` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `student_id` INT NOT NULL,
  `fee_type_id` INT NOT NULL,
  `amount` DECIMAL(15,2) NOT NULL,
  `paid_amount` DECIMAL(15,2) DEFAULT 0.00,
  `collection_month` VARCHAR(7),
  `receipt_number` VARCHAR(50),
  `payment_status` ENUM('pending', 'partial', 'paid', 'overdue') DEFAULT 'pending',
  `payment_date` DATE,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`student_id`) REFERENCES `students`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`fee_type_id`) REFERENCES `fee_types`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `vendors` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `contact_person` VARCHAR(255),
  `phone` VARCHAR(20),
  `email` VARCHAR(255),
  `address` TEXT,
  `city` VARCHAR(100),
  `country` VARCHAR(100),
  `payment_terms` VARCHAR(255),
  `tax_id` VARCHAR(50),
  `is_active` TINYINT DEFAULT 1,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `purchases` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `purchase_number` VARCHAR(50) UNIQUE NOT NULL,
  `vendor_id` INT NOT NULL,
  `warehouse_id` INT,
  `purchase_date` DATE NOT NULL,
  `expected_delivery_date` DATE,
  `subtotal` DECIMAL(15,2) DEFAULT 0.00,
  `tax_amount` DECIMAL(15,2) DEFAULT 0.00,
  `total_amount` DECIMAL(15,2) NOT NULL,
  `status` ENUM('draft', 'pending', 'received', 'cancelled') DEFAULT 'draft',
  `notes` TEXT,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`vendor_id`) REFERENCES `vendors`(`id`),
  FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `purchase_items` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `purchase_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity_ordered` INT NOT NULL,
  `quantity_received` INT DEFAULT 0,
  `unit_price` DECIMAL(15,2) NOT NULL,
  `line_total` DECIMAL(15,2) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`purchase_id`) REFERENCES `purchases`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`product_id`) REFERENCES `products`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `expenses` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `reference_number` VARCHAR(50) UNIQUE,
  `category_id` INT NOT NULL,
  `amount` DECIMAL(15,2) NOT NULL,
  `description` TEXT,
  `expense_date` DATE NOT NULL,
  `created_by` INT,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`created_by`) REFERENCES `users`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `expense_categories` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL UNIQUE,
  `slug` VARCHAR(255) UNIQUE NOT NULL,
  `description` TEXT,
  `is_active` TINYINT DEFAULT 1,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `roles` (`name`, `slug`, `description`, `is_system`) VALUES
('Super Admin', 'super_admin', 'Full system access', 1),
('Admin', 'admin', 'Administrative access', 1),
('Cashier', 'cashier', 'POS and sales access', 0),
('Stock Manager', 'stock_manager', 'Inventory management access', 0),
('Report Viewer', 'report_viewer', 'Read-only reports access', 0);

-- Insert default units
INSERT INTO `units` (`name`, `symbol`) VALUES
('Piece', 'pcs'),
('Kilogram', 'kg'),
('Liter', 'L'),
('Box', 'box'),
('Pack', 'pack'),
('Dozen', 'dz');

-- Insert default expense categories
INSERT INTO `expense_categories` (`name`, `slug`) VALUES
('Rent', 'rent'),
('Utilities', 'utilities'),
('Salaries', 'salaries'),
('Office Supplies', 'office_supplies'),
('Transportation', 'transportation'),
('Maintenance', 'maintenance'),
('Insurance', 'insurance'),
('Miscellaneous', 'miscellaneous');

-- Insert default exam types
INSERT INTO `exam_types` (`name`, `code`, `weight`) VALUES
('Homework', 'hw', 0.20),
('Mid-term', 'mid', 0.30),
('Final', 'final', 0.50);
