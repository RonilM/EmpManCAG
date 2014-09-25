<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEmployeesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		
		Schema::create('employees', function($table)
	    {
	    	$table->engine = 'InnoDB';

	        $table->string('EID')->primary();
	        $table->string('Name');
	        $table->date('DateOfBirth');
	        $table->string('EMail')->unique();
	        $table->string('Password');
	        $table->date('Date Of Joining');
	        $table->string('ProjectID');
	        $table->foreign('ProjectID')->references('ProjectID')->on('projects')->onDelete('cascade');
	        $table->float('Salary');
	        $table->string('TID');
	        $table->foreign('TID')->references('TID')->on('tiers')->onDelete('cascade');
	        $table->string('Approver1');
	        $table->foreign('Approver1')->references('EID')->on('employees')->onDelete('cascade');
	        $table->string('Approver2');
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
		Schema::dropIfExists('employees');
	}

}
