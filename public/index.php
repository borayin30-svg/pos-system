<?php
/**
 * POS Business System
 * Front Controller - Entry Point
 * 
 * All HTTP requests are routed through this file.
 * Version: 2.0
 * Developer: វន្នី Vanny
 */

// Define base path
define('BASE_PATH', dirname(__DIR__));
define('PUBLIC_PATH', __DIR__);

// Load bootstrap
require BASE_PATH . '/app/helpers/init.php';

// Get URL and dispatch
$url = $_GET['url'] ?? '';
$url = rtrim($url, '/');
$url = filter_var($url, FILTER_SANITIZE_URL);

// Create router and dispatch
$router = new \App\Core\Router();
$router->dispatch($url);
