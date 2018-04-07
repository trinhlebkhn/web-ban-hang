<?php

$application->registerModules(
    [
        "frontend" => [
            "className" => "Graduate\Frontend\Module",
            "path"      => __DIR__ . "/../apps/frontend/Module.php",
        ],
        "backend"  => [
            "className" => "Graduate\Backend\Module",
            "path"      => __DIR__ . "/../apps/backend/Module.php",
        ]
    ]
);