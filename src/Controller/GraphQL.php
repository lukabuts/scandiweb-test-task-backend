<?php
namespace App\Controller;

use App\GraphQL\GraphQLSchema;
use GraphQL\GraphQL as GraphQLBase;
use RuntimeException;
use Throwable;

class GraphQL
{
    public static function handle(): void
    {
        try {
            $schema = GraphQLSchema::create();

            $rawInput = file_get_contents('php://input');
            if ($rawInput === false) {
                throw new RuntimeException('Invalid request');
            }

            $input = json_decode($rawInput, true);
            if (is_null($input) || !isset($input['query'])) {
                throw new RuntimeException('Invalid GraphQL request');
            }

            $query = $input['query'];
            $variables = $input['variables'] ?? null;

            $result = GraphQLBase::executeQuery($schema, $query, null, null, $variables);
            $output = $result->toArray();
        } catch (Throwable $e) {
            // Log full error details
            error_log('GraphQL Error: ' . $e->getMessage() .
                    ' in ' . $e->getFile() .
                    ' on line ' . $e->getLine());

            // Prepare secure error response
            $output = [
                'errors' => [
                    [
                        'message' => ($_ENV['APP_DEBUG'] ?? false) ? $e->getMessage() : 'An error occurred',
                        'extensions' => [
                            'category' => 'execution'
                        ]
                    ]
                ]
            ];

            // Set appropriate HTTP status
            if ($e instanceof RuntimeException) {
                http_response_code(400);
            } else {
                http_response_code(500);
            }
        }

        echo json_encode($output, JSON_PRETTY_PRINT);
        exit;
    }
}
