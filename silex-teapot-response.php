<?php

$app = new MySilexApplication();

$app->match('/api/coffee/',
    function() use ($app){
        $statusCode = 418;
        $response = array('status' => 'ok', 'code' => $statusCode, 'message' => 'The HTCPCP Server is a teapot. The responding entity MAY be short and stout.');
        return $app->json((object) $response, $statusCode);
    }
);
