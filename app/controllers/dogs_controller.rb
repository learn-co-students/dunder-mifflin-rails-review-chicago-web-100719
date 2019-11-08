class DogsController < ApplicationController

    def index
        @dogs = Dog.all
        @dogs = @dogs.sort_by { |dog| -dog.employees.count }
    end

    def show
        find_dog
    end

    private
    def find_dog
        @dog = Dog.find(params[:id])
    end

end
