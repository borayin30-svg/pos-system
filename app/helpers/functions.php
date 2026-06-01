<?php
/**
 * Utility Functions
 */

/**
 * Format currency
 */
function format_currency($amount, $currency = 'USD')
{
    return number_format($amount, 2, '.', ',') . ' ' . $currency;
}

/**
 * Format date
 */
function format_date($date, $format = 'Y-m-d')
{
    if (is_string($date)) {
        $date = strtotime($date);
    }
    return date($format, $date);
}

/**
 * Format datetime
 */
function format_datetime($datetime, $format = 'Y-m-d H:i:s')
{
    if (is_string($datetime)) {
        $datetime = strtotime($datetime);
    }
    return date($format, $datetime);
}

/**
 * Human readable time difference
 */
function time_ago($datetime)
{
    $time = strtotime($datetime);
    $diff = time() - $time;

    if ($diff < 60) {
        return $diff . ' seconds ago';
    } elseif ($diff < 3600) {
        return floor($diff / 60) . ' minutes ago';
    } elseif ($diff < 86400) {
        return floor($diff / 3600) . ' hours ago';
    } elseif ($diff < 2592000) {
        return floor($diff / 86400) . ' days ago';
    } else {
        return date('Y-m-d', $time);
    }
}

/**
 * Convert to slug
 */
function slugify($string)
{
    $string = strtolower($string);
    $string = preg_replace('/[^a-z0-9]+/i', '-', $string);
    return trim($string, '-');
}

/**
 * Generate UUID
 */
function generate_uuid()
{
    return sprintf(
        '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
        mt_rand(0, 0xffff), mt_rand(0, 0xffff),
        mt_rand(0, 0xffff),
        mt_rand(0, 0x0fff) | 0x4000,
        mt_rand(0, 0x3fff) | 0x8000,
        mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0xffff)
    );
}

/**
 * Generate SKU
 */
function generate_sku($prefix = 'SKU')
{
    return $prefix . date('YmdHis') . random_int(100000, 999999);
}

/**
 * Array to JSON
 */
function to_json($array)
{
    return json_encode($array, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
}

/**
 * JSON to Array
 */
function from_json($json)
{
    return json_decode($json, true);
}

/**
 * Log message
 */
function log_message($message, $type = 'info', $file = 'app.log')
{
    $log_path = BASE_PATH . '/logs/' . $file;
    $timestamp = date('Y-m-d H:i:s');
    $log_entry = "[$timestamp] [$type] $message" . PHP_EOL;

    if (!is_dir(dirname($log_path))) {
        mkdir(dirname($log_path), 0755, true);
    }

    file_put_contents($log_path, $log_entry, FILE_APPEND);
}

/**
 * Calculate percentage
 */
function calculate_percentage($value, $total)
{
    if ($total == 0) return 0;
    return ($value / $total) * 100;
}

/**
 * Round to nearest value
 */
function round_nearest($value, $nearest)
{
    return round($value / $nearest) * $nearest;
}
