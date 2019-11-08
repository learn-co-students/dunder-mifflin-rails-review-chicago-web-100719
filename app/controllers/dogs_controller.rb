class DogsController < ApplicationController
    before_action :find_dog, only: [:show, :edit, :update]

    def index
        @dogs = Dog.all 
        @employees = Employee.all
    end

    def show

    end



    private

    def find_dog
        @dog = Dog.find(params[:id])
    end
end
