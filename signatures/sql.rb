# A hash of interesting PHP data
$signatures[:sql] = {
	:markup_injections => %w[
		<script
		<iframe
	],
	
	:php_injections => %w[
	<?php
	<?
	<?=
	]
}
