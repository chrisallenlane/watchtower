# A hash of interesting PHP data
$payloads[:sql] = {
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
