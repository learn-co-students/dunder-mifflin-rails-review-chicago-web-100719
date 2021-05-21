class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            redirect_to @employee
        else
            render :new
        end
    end

    def edit
        find_employee
    end

    def update
        find_employee
        @employee.update(employee_params)
        if @employee.save
            redirect_to @employee
        else
            render :edit
        end
    end

    def show
        find_employee
    end

    private
    def find_employee
        @employee = Employee.find(params[:id])
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :dog_id)
    end

end
