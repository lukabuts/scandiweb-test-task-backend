<?php
declare(strict_types=1);

require_once __DIR__ . '/../vendor/autoload.php';

use Dotenv\Dotenv;
use FastRoute\Dispatcher;

// Load environment variables securely
try {
    $dotenv = Dotenv::createImmutable(__DIR__ . '/../');
    $dotenv->load();
    $dotenv->required(['DB_HOST', 'DB_DATABASE', 'DB_USERNAME', 'DB_PASSWORD'])->notEmpty();
} catch (Throwable $e) {
    header('Content-Type: application/json');
    http_response_code(500);
    exit(json_encode([
        'status' => 'error',
        'message' => 'Configuration error'
    ]));
}

// Security headers
header('X-Content-Type-Options: nosniff');
header('X-Frame-Options: DENY');
header('X-XSS-Protection: 1; mode=block');

// CORS Handling
$allowedOrigins = array_filter(explode(',', $_ENV['ALLOWED_ORIGINS'] ?? ''));
$requestOrigin = $_SERVER['HTTP_ORIGIN'] ?? '';

if (in_array($requestOrigin, $allowedOrigins, true)) {
    header("Access-Control-Allow-Origin: $requestOrigin");
    header('Access-Control-Allow-Credentials: true');
} elseif (!empty($allowedOrigins)) {
    header("Access-Control-Allow-Origin: {$allowedOrigins[0]}"); // Fallback to first allowed origin
}

header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
header('Access-Control-Max-Age: 86400');
header('Vary: Origin');

// Handle preflight requests
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(204);
    exit;
}

// Database connection with error handling
try {
    App\Config\Database::getConnection();
} catch (Throwable $e) {
    header('Content-Type: application/json');
    http_response_code(503);
    exit(json_encode([
        'status' => 'error',
        'message' => 'Service unavailable'
    ]));
}

// Route configuration
$dispatcher = FastRoute\simpleDispatcher(function (FastRoute\RouteCollector $r) {
    $r->addRoute('POST', '/graphql', [App\Controller\GraphQL::class, 'handle']);
    
    // Add health check endpoint
    $r->addRoute('GET', '/health', function () {
        return json_encode(['status' => 'healthy']);
    });
});

// Route dispatching
$httpMethod = $_SERVER['REQUEST_METHOD'];
$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

try {
    $routeInfo = $dispatcher->dispatch($httpMethod, $uri);
    
    switch ($routeInfo[0]) {
        case Dispatcher::NOT_FOUND:
            http_response_code(404);
            echo json_encode([
                'status' => 'error',
                'message' => 'Not Found'
            ]);
            break;
            
        case Dispatcher::METHOD_NOT_ALLOWED:
            http_response_code(405);
            header('Allow: ' . implode(', ', $routeInfo[1]));
            echo json_encode([
                'status' => 'error',
                'message' => 'Method Not Allowed'
            ]);
            break;
            
        case Dispatcher::FOUND:
            $handler = $routeInfo[1];
            $vars = $routeInfo[2];
            
            if (is_callable($handler)) {
                echo $handler($vars);
            } elseif (is_array($handler) && class_exists($handler[0])) {
                $controller = new $handler[0];
                echo $controller->{$handler[1]}($vars);
            } else {
                throw new RuntimeException('Invalid handler');
            }
            break;
    }
} catch (Throwable $e) {
    error_log('Application error: ' . $e->getMessage());
    http_response_code(500);
    echo json_encode([
        'status' => 'error',
        'message' => 'Internal Server Error'
    ]);
}
