<?php
/**
 * Authentication Middleware
 */

namespace App\Middleware;

class AuthMiddleware
{
    public function handle()
    {
        // Public routes that don't require authentication
        $public_routes = [
            'login',
            'logout',
            'installer',
        ];

        $current_url = $_GET['url'] ?? '';

        // Check if current route is public
        foreach ($public_routes as $route) {
            if (strpos($current_url, $route) === 0) {
                return true;
            }
        }

        // Check if user is authenticated
        if (empty($_SESSION['user'])) {
            header("Location: " . base_url('/login'));
            exit;
        }

        return true;
    }
}
