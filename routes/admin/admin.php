<?php
	
	
	Route::post('/loginProcess', [App\Http\Controllers\Admin\AuthController::class, 'login_process']);

	$admin_path =config('app.project.admin_panel_slug');
	

	Route::group(['prefix' => $admin_path,'middleware'=>['is_admin']], function () {
		
        /*----------------------------------------------------------------------------------------
			Employee
		----------------------------------------------------------------------------------------*/

		Route::group(array('prefix'=>'/employee'), function ()
		{
			Route::get('/',[App\Http\Controllers\Admin\EmployeeController::class, 'index'])->name('admin.employee');
			Route::get('/loadData',[App\Http\Controllers\Admin\EmployeeController::class, 'loadData'])->name('admin.loadData');
			Route::get('/EmployeeCreate',[App\Http\Controllers\Admin\EmployeeController::class, 'create'])->name('employeeCreate');
			Route::post('/store',[App\Http\Controllers\Admin\EmployeeController::class, 'store'])->name('employee.store');
			Route::get('/delete/{id}',[App\Http\Controllers\Admin\EmployeeController::class, 'delete'])->name('employee.delete');
			Route::any('/edit/{id}',[App\Http\Controllers\Admin\EmployeeController::class, 'edit'])->name('employee.edit');
			Route::any('/active/{id}',[App\Http\Controllers\Admin\EmployeeController::class, 'active'])->name('employee.active');
			Route::any('/deactive/{id}',[App\Http\Controllers\Admin\EmployeeController::class, 'deactive'])->name('employee.deactive');
			Route::any('/update',[App\Http\Controllers\Admin\EmployeeController::class, 'update'])->name('employee.update');
		
			
		});

		/*----------------------------------------------------------------------------------------
			Comppany
		----------------------------------------------------------------------------------------*/

		Route::group(array('prefix'=>'/company'), function ()
		{
		
            Route::get('/',[App\Http\Controllers\Admin\CompanyController::class, 'index'])->name('admin.company');
			Route::get('/loadData',[App\Http\Controllers\Admin\CompanyController::class, 'load_data'])->name('admin.loadData');
			Route::get('/CompanyCreate',[App\Http\Controllers\Admin\CompanyController::class, 'create'])->name('companyCreate');
			Route::post('/store',[App\Http\Controllers\Admin\CompanyController::class, 'store'])->name('company.store');
			Route::get('/delete/{id}',[App\Http\Controllers\Admin\CompanyController::class, 'delete'])->name('company.delete');
			Route::any('/edit/{id}',[App\Http\Controllers\Admin\CompanyController::class, 'edit'])->name('company.edit');
			Route::any('/active/{id}',[App\Http\Controllers\Admin\CompanyController::class, 'active'])->name('company.active');
			Route::any('/deactive/{id}',[App\Http\Controllers\Admin\CompanyController::class, 'deactive'])->name('company.deactive');
			Route::any('/update',[App\Http\Controllers\Admin\CompanyController::class, 'update'])->name('company.update');
			Route::post('/importExcel',[App\Http\Controllers\Admin\CompanyController::class, 'import'])->name('import');
			Route::post('/exportExcel',[App\Http\Controllers\Admin\CompanyController::class, 'export'])->name('export');
			
		});

});




	