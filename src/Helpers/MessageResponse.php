<?php

namespace App\Helpers;

class MessageResponse
{
    public static function create(bool $success, string $message): array
    {
        return [
            'success' => $success,
            'message' => $message,
        ];
    }
}
