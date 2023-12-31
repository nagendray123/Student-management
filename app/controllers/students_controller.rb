class StudentsController < ApplicationController
   before_action :set_student, only: %i[show edit update destroy] 

	def index
	 @students = Student.all
	end

	def new
	 @student = Student.new
	end

	def create
     @student = Student.new(student_params)
	  if @student.save
	  	 redirect_to students_path, notice: "Student has been created successfully"
	  else
	  	 render :new, status: :unprocessable_entity
	  end
	end

	def show
	 # @student = Student.find(params[:id])
	end

	def edit
	 # @student = Student.find(params[:id])
	end

	def update
	 # @student = Student.find(params[:id])
	 if @student.update(student_params)
	 	 redirect_to @student, notice: "Student has been updated successfully"
	 else
	 	 render :edit, status: :unprocessable_entity
	 end
	end

	def destroy
	 # @student = Student.find(params[:id])
	 @student.destroy

	 redirect_to @student, status: :see_other, notice: "Student has been deleted successfully"
	end

	private
	def student_params
	  params.require(:student).permit(:first_name, :last_name, :email)
	end

	def set_student
	 @student = Student.find(params[:id])
	end
end