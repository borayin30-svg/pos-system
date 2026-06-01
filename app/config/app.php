<?php
/**
 * Application Configuration
 */

return [
    'name' => $_ENV['APP_NAME'] ?? 'POS Business System',
    'url' => $_ENV['APP_URL'] ?? 'http://localhost/pos-system',
    'env' => $_ENV['APP_ENV'] ?? 'production',
    'debug' => $_ENV['APP_DEBUG'] ?? false,
    
    // Default timezone
    'timezone' => 'Asia/Phnom_Penh',
    
    // Default language
    'language' => 'en',
    'fallback_language' => 'en',
    'available_languages' => ['en', 'kh'],
    
    // Currency
    'currency' => 'USD',
    'currency_symbol' => '$',
    
    // Pagination
    'pagination' => [
        'per_page' => 15,
    ],
    
    // Session
    'session_name' => 'POS_SESSION',
    'session_timeout' => $_ENV['SESSION_TIMEOUT'] ?? 1800,
    
    // Upload
    'upload' => [
        'max_size' => 5 * 1024 * 1024, // 5MB
        'allowed_extensions' => ['jpg', 'jpeg', 'png', 'gif', 'pdf', 'doc', 'docx', 'xls', 'xlsx'],
        'path' => BASE_PATH . '/assets/uploads',
    ],
    
    // Business configuration
    'business' => [
        'types' => ['retail', 'grocery', 'mini_mart', 'school'],
    ],
];
