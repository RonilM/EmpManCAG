<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProjecttoleadmappingTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('CreateProjecttoleadmapping', function($table)
	    {	
	     $table->engine = 'InnoDB';

		 $table->string('ProjectID');
	     $table->foreign('ProjectID')->references('ProjectID')->on('projects')->onDelete('cascade');
	     $table->string('ProjectLeadEID');
	     $table->foreign('ProjectLeadEID')->references('EID')->on('employees')->onDelete('cascade');
	 });
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		//
	}

}
