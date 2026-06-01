<?php
/**
 * Default Permissions Configuration
 * These will be seeded into the database during installation
 */

return [
    // Core Permissions
    'core' => [
        'dashboard.view' => 'View Dashboard',
    ],
    
    // User Management
    'users' => [
        'users.view' => 'View Users',
        'users.create' => 'Create User',
        'users.edit' => 'Edit User',
        'users.delete' => 'Delete User',
    ],
    
    // Role Management
    'roles' => [
        'roles.view' => 'View Roles',
        'roles.create' => 'Create Role',
        'roles.edit' => 'Edit Role',
        'roles.delete' => 'Delete Role',
        'roles.permissions' => 'Manage Role Permissions',
    ],
    
    // Permission Management
    'permissions' => [
        'permissions.view' => 'View Permissions',
        'permissions.create' => 'Create Permission',
        'permissions.edit' => 'Edit Permission',
        'permissions.delete' => 'Delete Permission',
    ],
    
    // Product Management
    'products' => [
        'products.view' => 'View Products',
        'products.create' => 'Create Product',
        'products.edit' => 'Edit Product',
        'products.delete' => 'Delete Product',
        'products.import' => 'Import Products',
        'products.export' => 'Export Products',
    ],
    
    // Category Management
    'categories' => [
        'categories.view' => 'View Categories',
        'categories.create' => 'Create Category',
        'categories.edit' => 'Edit Category',
        'categories.delete' => 'Delete Category',
    ],
    
    // Brand Management
    'brands' => [
        'brands.view' => 'View Brands',
        'brands.create' => 'Create Brand',
        'brands.edit' => 'Edit Brand',
        'brands.delete' => 'Delete Brand',
    ],
    
    // Unit Management
    'units' => [
        'units.view' => 'View Units',
        'units.create' => 'Create Unit',
        'units.edit' => 'Edit Unit',
        'units.delete' => 'Delete Unit',
    ],
    
    // Sales
    'sales' => [
        'sales.view' => 'View Sales',
        'sales.create' => 'Create Sale / POS',
        'sales.edit' => 'Edit Sale',
        'sales.void' => 'Void Sale',
        'sales.export' => 'Export Sales',
    ],
    
    // Refunds
    'refunds' => [
        'refunds.view' => 'View Refunds',
        'refunds.create' => 'Create Refund',
        'refunds.approve' => 'Approve Refund',
        'refunds.reject' => 'Reject Refund',
    ],
    
    // Quotations
    'quotations' => [
        'quotations.view' => 'View Quotations',
        'quotations.create' => 'Create Quotation',
        'quotations.edit' => 'Edit Quotation',
        'quotations.delete' => 'Delete Quotation',
        'quotations.convert' => 'Convert to Sale',
    ],
    
    // Customers
    'customers' => [
        'customers.view' => 'View Customers',
        'customers.create' => 'Create Customer',
        'customers.edit' => 'Edit Customer',
        'customers.delete' => 'Delete Customer',
        'customers.wallet' => 'Manage Customer Wallet',
        'customers.points' => 'Manage Customer Points',
    ],
    
    // Rewards
    'rewards' => [
        'rewards.view' => 'View Rewards',
        'rewards.create' => 'Create Reward',
        'rewards.edit' => 'Edit Reward',
        'rewards.delete' => 'Delete Reward',
        'rewards.redeem' => 'Redeem Reward',
    ],
    
    // Gift Cards
    'gift_cards' => [
        'gift_cards.view' => 'View Gift Cards',
        'gift_cards.create' => 'Create Gift Card',
        'gift_cards.edit' => 'Edit Gift Card',
        'gift_cards.delete' => 'Delete Gift Card',
    ],
    
    // Vendors
    'vendors' => [
        'vendors.view' => 'View Vendors',
        'vendors.create' => 'Create Vendor',
        'vendors.edit' => 'Edit Vendor',
        'vendors.delete' => 'Delete Vendor',
    ],
    
    // Purchases
    'purchases' => [
        'purchases.view' => 'View Purchases',
        'purchases.create' => 'Create Purchase',
        'purchases.edit' => 'Edit Purchase',
        'purchases.delete' => 'Delete Purchase',
        'purchases.approve' => 'Approve Purchase',
        'purchases.receive' => 'Receive Purchase',
        'purchases.export' => 'Export Purchases',
    ],
    
    // Purchase Returns
    'purchase_returns' => [
        'purchase_returns.view' => 'View Purchase Returns',
        'purchase_returns.create' => 'Create Purchase Return',
        'purchase_returns.approve' => 'Approve Purchase Return',
    ],
    
    // Inventory
    'inventory' => [
        'inventory.view' => 'View Inventory',
        'inventory.adjust' => 'Adjust Stock',
        'inventory.export' => 'Export Inventory',
    ],
    
    // Warehouse
    'warehouses' => [
        'warehouses.view' => 'View Warehouses',
        'warehouses.create' => 'Create Warehouse',
        'warehouses.edit' => 'Edit Warehouse',
        'warehouses.delete' => 'Delete Warehouse',
    ],
    
    // Stock Transfer
    'stock' => [
        'stock.transfer' => 'Transfer Stock',
        'stock.take' => 'Physical Stock Take',
    ],
    
    // Expenses
    'expenses' => [
        'expenses.view' => 'View Expenses',
        'expenses.create' => 'Create Expense',
        'expenses.edit' => 'Edit Expense',
        'expenses.delete' => 'Delete Expense',
        'expenses.export' => 'Export Expenses',
    ],
    
    // Income
    'income' => [
        'income.view' => 'View Income',
        'income.create' => 'Create Income',
        'income.edit' => 'Edit Income',
        'income.delete' => 'Delete Income',
        'income.export' => 'Export Income',
    ],
    
    // Shifts
    'shifts' => [
        'shifts.view' => 'View Shifts',
        'shifts.open' => 'Open Shift',
        'shifts.close' => 'Close Shift',
        'shifts.handover' => 'Shift Handover',
    ],
    
    // Reports
    'reports' => [
        'reports.view' => 'View Reports',
        'reports.export' => 'Export Reports',
        'reports.sales' => 'Sales Report',
        'reports.profit_loss' => 'Profit & Loss Report',
        'reports.employee_kpi' => 'Employee KPI Report',
        'reports.commission' => 'Commission Report',
        'reports.cash_flow' => 'Cash Flow Report',
        'reports.accounting' => 'Accounting Export',
    ],
    
    // Promotions
    'promotions' => [
        'promotions.view' => 'View Promotions',
        'promotions.create' => 'Create Promotion',
        'promotions.edit' => 'Edit Promotion',
        'promotions.delete' => 'Delete Promotion',
    ],
    
    // Notifications
    'notifications' => [
        'notifications.view' => 'View Notifications',
        'notifications.manage' => 'Manage Notifications',
    ],
    
    // Backup
    'backup' => [
        'backup.view' => 'View Backups',
        'backup.create' => 'Create Backup',
        'backup.restore' => 'Restore Backup',
        'backup.delete' => 'Delete Backup',
        'backup.manage' => 'Manage Backups',
    ],
    
    // Settings
    'settings' => [
        'settings.view' => 'View Settings',
        'settings.general' => 'Manage General Settings',
        'settings.exchange_rates' => 'Manage Exchange Rates',
        'settings.email' => 'Manage Email Settings',
        'settings.telegram' => 'Manage Telegram Settings',
    ],
    
    // Deliveries
    'deliveries' => [
        'deliveries.view' => 'View Deliveries',
        'deliveries.create' => 'Create Delivery',
        'deliveries.edit' => 'Edit Delivery',
        'deliveries.delete' => 'Delete Delivery',
    ],
    
    // Layaway
    'layaway' => [
        'layaway.view' => 'View Layaway',
        'layaway.create' => 'Create Layaway',
        'layaway.edit' => 'Edit Layaway',
        'layaway.delete' => 'Delete Layaway',
    ],
    
    // Chat
    'chat' => [
        'chat.view' => 'View Chat',
        'chat.send' => 'Send Message',
    ],
    
    // Feedback
    'feedback' => [
        'feedback.view' => 'View Feedback',
        'feedback.delete' => 'Delete Feedback',
    ],
    
    // Barcode
    'barcode' => [
        'barcode.generate' => 'Generate Barcode',
        'barcode.print' => 'Print Barcode',
    ],
    
    // School Module
    'school' => [
        'school.settings.manage' => 'Manage School Settings',
        'school.subjects.view' => 'View Subjects',
        'school.subjects.create' => 'Create Subject',
        'school.subjects.edit' => 'Edit Subject',
        'school.subjects.delete' => 'Delete Subject',
        'school.levels.view' => 'View Class Levels',
        'school.levels.create' => 'Create Class Level',
        'school.levels.edit' => 'Edit Class Level',
        'school.levels.delete' => 'Delete Class Level',
        'school.classes.view' => 'View Classes',
        'school.classes.create' => 'Create Class',
        'school.classes.edit' => 'Edit Class',
        'school.classes.delete' => 'Delete Class',
        'school.students.view' => 'View Students',
        'school.students.create' => 'Create Student',
        'school.students.edit' => 'Edit Student',
        'school.students.delete' => 'Delete Student',
        'school.attendance.view' => 'View Attendance',
        'school.attendance.mark' => 'Mark Attendance',
        'school.attendance.submit' => 'Submit Attendance',
        'school.scores.view' => 'View Scores',
        'school.scores.create' => 'Create Score',
        'school.scores.edit' => 'Edit Score',
        'school.scores.delete' => 'Delete Score',
        'school.ranking.view' => 'View Ranking',
        'school.ranking.school_best' => 'View School-Wide Best (Principal Only)',
        'school.fees.view' => 'View Fees',
        'school.fees.collect' => 'Collect Fees',
        'school.fees.manage' => 'Manage Fee Types',
        'school.reports.view' => 'View School Reports',
        'school.reports.export' => 'Export School Reports',
    ],
    
    // Supplier Portal
    'supplier' => [
        'supplier.portal' => 'Access Supplier Portal',
    ],
];
