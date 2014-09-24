<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStatusesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('statustypes', function($table)
	    {	
	    	$table->engine = 'InnoDB';

	        $table->string('StatusID')->primary();
	        $table->string('StatusName')->unique();
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
		Schema::dropIfExists('statustypes');
	}

}
