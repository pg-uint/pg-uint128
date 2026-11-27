<?php

declare(strict_types=1);

$fileName = 'uint128--1.3.0--1.4.0.sql';
file_put_contents($fileName, "-- PostgreSQL 19 compatibility only changes the shared library.\n");
echo "$fileName successfully generated\n";
