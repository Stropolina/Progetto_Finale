<?php
require("./lib/vendor/autoload.php");

$openapi = \OpenApi\Generator::scan(['activity_service.php']);

header('Content-Type: application/x-yaml');
echo $openapi->toYaml();