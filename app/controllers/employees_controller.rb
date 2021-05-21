class EmployeesController < ApplicationController

    def index 
        @employees = Employee.all
    end

    def show
        find_emp
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)

        if @employee.valid?
            @employee.save
            redirect_to employee_path(@employee)
        else
            render :new
        end
    end

    def edit
        find_emp
    end

    def update
        find_emp
        if @employee.update(employee_params).valid?
            redirect_to employee_path(@employee)
        else
            render :edit
        end
    end

    def destroy
        find_emp.destroy
        redirect_to employees_path
    end

    private 
    
    def find_emp
        @employee = Employee.find(params[:id])
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :title, :alias, :office, :img_url, :dog_id) 
    end
end
