<?php

namespace App\Config;

use Illuminate\Database\Capsule\Manager as Capsule;
use Dotenv\Dotenv;

class Database
{
    private static $connection = null;

    public static function getConnection(): Capsule
    {
        if (self::$connection === null) {
            try {
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
            } catch (\Exception $e) {
                echo json_encode([
                    'status' => 'Database connection failed:',
                    'message' => $e->getMessage()
                ]);
                exit;
            }
        }

        return self::$connection;
    }

    public static function closeConnection(): void
    {
        self::$connection = null;
    }
}
