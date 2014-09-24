<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFinancearchivesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('financearchives', function($table)
	    {	
	    	$table->engine = 'InnoDB';

	        $table->string('ReqID')->primary();
	        $table->string('EID');
	        $table->foreign('EID')->references('EID')->on('employees')->onDelete('cascade');
	        $table->string('FRID');
	        $table->foreign('FRID')->references('FRID')->on('finrequesttypes')->onDelete('cascade');
	        $table->date('DateOfExpense');
	        $table->float('Amount');
	        $table->string('DescriptionOfExpense');
	        $table->string('PaymentCategory');
	        $table->string('PaymentMadeTo');
	        $table->string('BillNumber');
	        $table->string('BillType');
	        $table->string('BillFilePath');
	        $table->string('ApproverEID');
	        $table->foreign('ApproverEID')->references('EID')->on('employees')->onDelete('cascade')->nullable();
	        $table->string('Approver2EID');
	        $table->foreign('Approver2EID')->references('EID')->on('employees')->onDelete('cascade')->nullable();
	        $table->string('ProjectID');
	        $table->foreign('ProjectID')->references('ProjectID')->on('projects')->onDelete('cascade')->nullable();
	        $table->string('Comments');
	        $table->date('AdvancePaymentDate');
	        $table->string('StatusID');
	        $table->foreign('StatusID')->references('StatusID')->on('statustypes')->onDelete('cascade');
	        $table->boolean('HardCopyReceived');
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
		Schema::dropIfExists('financearchives');
	}

}
