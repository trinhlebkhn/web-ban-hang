<?php

// Register the installed modules
$application->registerModules(
    [
        "frontend" => [
            "className" => "Multiple\Frontend\Module",
            "path"      => "../apps/frontend/Module.php",
        ],
        "backend"  => [
            "className" => "Multiple\Backend\Module",
            "path"      => "../apps/backend/Module.php",
        ]
    ]
);