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
                throw new RuntimeException('Failed to read input');
            }

            $input = json_decode($rawInput, true);
            if (is_null($input) || !isset($input['query'])) {
                throw new RuntimeException('Missing or invalid GraphQL query');
            }

            $query = $input['query'];
            $variables = $input['variables'];

            $result = GraphQLBase::executeQuery($schema, $query, null, null, $variables);
            $output = $result->toArray();
        } catch (Throwable $e) {
            $output = [
                'errors' => [
                    [
                        'message' => $e->getMessage(),
                        'locations' => [
                            [
                                'line' => $e->getLine(),
                                'column' => $e->getFile(),
                            ],
                        ],
                    ],
                ],
            ];
        }

        echo json_encode($output);
    }
}
