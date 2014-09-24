<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFinrequesttypesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('finrequesttypes', function($table)
	    {
	    	$table->engine = 'InnoDB';
	    	
	        $table->string('FRID')->primary();
	        $table->string('RequestName')->unique();
	        $table->integer('RequestDescription');
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
		Schema::dropIfExists('finrequesttypes');
	}

}
