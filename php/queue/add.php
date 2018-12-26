<?php

require 'vendor/chrisboulton/php-resque/lib/Resque.php';
// use lib\Resque;

// Required if redis is located elsewhere
Resque::setBackend('localhost:6379');

$args = array(
        'name' => 'Chris'
        );
$jobId = Resque::enqueue('default', 'My_Job', $args, true);
echo $jobId;
