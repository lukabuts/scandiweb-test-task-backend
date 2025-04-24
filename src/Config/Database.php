<?php

namespace App\Config;

use Illuminate\Database\Capsule\Manager as Capsule;
use Dotenv\Dotenv;
use PDOException;
use Exception;

class Database
{
    private static ?Capsule $connection = null;

    public static function getConnection(): Capsule
    {
        if (self::$connection === null) {
            try {
                // Load environment variables
                $dotenv = Dotenv::createImmutable(__DIR__ . '/../../');
                $dotenv->load();

                $capsule = new Capsule;

                $capsule->addConnection([
                    'driver'    => $_ENV['DB_DRIVER'],
                    'host'      => $_ENV['DB_HOST'],
                    'port'      => $_ENV['DB_PORT'],
                    'database'  => $_ENV['DB_DATABASE'],
                    'username'  => $_ENV['DB_USERNAME'],
                    'password'  => $_ENV['DB_PASSWORD'],
                    'charset'   => $_ENV['DB_CHARSET'],
                    'collation' => $_ENV['DB_COLLATION'],
                ]);

                $capsule->setAsGlobal();
                $capsule->bootEloquent();

                self::$connection = $capsule;

            } catch (PDOException $e) {
                // Database-specific errors
                self::handleDatabaseError($e);
            } catch (Exception $e) {
                // General errors
                self::handleGenericError($e);
            }
        }

        return self::$connection;
    }

    public static function closeConnection(): void
    {
        self::$connection = null;
    }

    private static function handleDatabaseError(PDOException $e): void
    {
        $isDebug = filter_var($_ENV['APP_DEBUG'] ?? false, FILTER_VALIDATE_BOOLEAN);
        $message = $isDebug ? $e->getMessage() : 'Database service unavailable';

        // Log full error details
        error_log('Database Connection PDOException: ' . $e->getMessage());
        
        // Secure response
        http_response_code(503);
        header('Content-Type: application/json');
        echo json_encode([
            'status' => 'error',
            'message' => $message,
            'code' => $e->getCode()
        ]);
        exit;
    }

    private static function handleGenericError(Exception $e): void
    {
        // Log full error details
        error_log('Database Connection Exception: ' . $e->getMessage());
        
        // Secure response
        http_response_code(500);
        header('Content-Type: application/json');
        echo json_encode([
            'status' => 'error',
            'message' => 'Service unavailable'
        ]);
        exit;
    }
}
