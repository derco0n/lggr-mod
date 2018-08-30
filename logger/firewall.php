<?php
require 'inc/pre.inc.php';

define('TITLE', 'Firewall');
require 'tpl/head.inc.php';

$l = null;
try {
    $l = new Lggr($state, $config);
    
    $aEvents = $l->getFirewall(0, LggrState::PAGELEN);
}
catch (LggrException $e) {
    echo '<div class="container"><div class="alert alert-danger" role="alert">' .
         $e->getMessage() . '</div></div>';
    
    require 'tpl/foot.inc.php';
    
    exit();
}

$searchvalueprog = '';
$searchvalue = '';

require 'tpl/nav.inc.php';
?>

<div class="container">
<?php

if (0 == count($aEvents)) {
    echo '<div class="alert alert-danger" role="alert">' . _('empty result') .
         '</div>';
} // if

?>
</div>

<div id="liveheader" class="container">
    <h2>
        <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span> <?= _('Live view') ?> <span
            id="tslatest"></span> <a id="pauseplay" href="#"><span
            class="glyphicon glyphicon-pause"></span></a>
    </h2>
</div>

<div class="container-fluid">
<?php
include 'tpl/firewallhead.inc.php';
?>
</div>

<div class="container-fluid datablock">
<?php

$i = 0;
foreach ($aEvents as $event) {
    $i ++;
    
    if (0 == $i % 2) {
        $rowclass = 'even';
    } else {
        $rowclass = 'odd';
    } // if
    
    switch ($event->ACTION) {
        case 'REJECT':
            $label = '<span class="label label-danger">REJECT</span>';
            break;        
        case 'MSSFIX':
            $label = '<span class="label label-warning">MSSFIX</span>';
            break;        
        case 'ALLOW':
            $label = '<span class="label label-success">ALLOW</span>';
            break;
		case 'FORWARD':
            $label = '<span class="label label-success">FORWARD</span>';
            break;
        default:
            $label = '<span class="label label-default">' . "" .
                 '</span>';
    } // switch
    
    //$host = htmlentities($event->host, ENT_HTML5 | ENT_SUBSTITUTE | ENT_QUOTES);
    //$program = htmlentities($event->program,        ENT_HTML5 | ENT_SUBSTITUTE | ENT_QUOTES);
    //$msg = htmlentities($event->message, ENT_HTML5 | ENT_SUBSTITUTE | ENT_QUOTES);
    
    echo ("
<div class='row datarow $rowclass' data-id='{$event->id}'>
	<div class='col-md-1 col-xs-2'>{$event->id}</div>
    <div class='col-md-1 col-xs-2'>{$event->date}</div>
    <div class='col-md-1 col-xs-2'>{$event->Router}</div>
    <div class='col-md-1 col-xs-20'>{$event->ACTION}</div>
    <div class='col-md-1 col-xs-2'>{$event->IN}</div>
    <div class='col-md-1 col-xs-2'>{$event->OUT}</div>");
    if ($event->SPORT == "443" && $event->PROTOCOL == "TCP"){
		echo("<div class='col-md-1 col-xs-2'><a href='https://{$event->SHOST}' target='new'>{$event->SHOST}</a></div>");
	}
	else if ($event->SPORT == "80" && $event->PROTOCOL == "TCP"){
		echo("<div class='col-md-1 col-xs-2'><a href='http://{$event->SHOST}' target='new'>{$event->SHOST}</a></div>");
	}
	else {
		echo("<div class='col-md-1 col-xs-2'>{$event->SHOST}</div>");
		}	
		
	echo("<div class='col-md-1 col-xs-2'>{$event->SPORT}</div>");
	
	if ($event->DPORT == "443" && $event->PROTOCOL == "TCP"){
		echo("<div class='col-md-1 col-xs-2'><a href='https://{$event->DHOST}' target='new'>{$event->DHOST}</a></div>");
	}
	else if ($event->DPORT == "80" && $event->PROTOCOL == "TCP"){
		echo("<div class='col-md-1 col-xs-2'><a href='http://{$event->DHOST}' target='new'>{$event->DHOST}</a></div>");
	}
	else {
		echo("<div class='col-md-1 col-xs-2'>{$event->DHOST}</div>");
		}	
	
	echo("
	<div class='col-md-1 col-xs-2'>{$event->DPORT}</div>
	<div class='col-md-1 col-xs-8'>{$event->PROTOCOL}</div>
</div><!-- row -->
");
} // foreach
?>
<div id="dialog" title="Details">I'm a dialog</div>

</div>

<?php
$aPerf = $l->getPerf();
require 'tpl/foot.inc.php'?>
