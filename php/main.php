<?php 

$userid = '0800010000000000000000000000000002147359';
$serverId = '74901';
$time = '1529043653072';
$k = '0zt39i1jtb98he7ar32z9e802654yg14';
$ret = md5($userid . $serverId . $time . $k);
echo $ret;
