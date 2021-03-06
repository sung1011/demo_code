<?php

// $argv[1] = '37df8476c82a4ec52ac7633c9aab0484';

if (empty($argv[1])) {
    die('Specify the ID of a job to monitor the status of.');
}

require 'vendor/chrisboulton/php-resque/lib/Resque/Job/Status.php';
require 'vendor/chrisboulton/php-resque/lib/Resque.php';
date_default_timezone_set('GMT');
Resque::setBackend('127.0.0.1:6379');

$status = new Resque_Job_Status($argv[1]);
if (!$status->isTracking()) {
    die("Resque is not tracking the status of this job.\n");
}

echo "Tracking status of ".$argv[1].". Press [break] to stop.\n\n";
while (true) {
    fwrite(STDOUT, "Status of ".$argv[1]." is: ".$status->get()."\n");
    sleep(1);
}
