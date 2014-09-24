<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTiersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tiers', function($table)
	    {
	    	$table->engine = 'InnoDB';
	    	
	        $table->string('TID')->primary();
	        $table->string('TierName');
	        $table->integer('TierLevel')->unique();
	        $table->timestamps();
	    });
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::dropIfExists('tiers');
	}

}
