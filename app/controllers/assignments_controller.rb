class AssignmentsController < ApplicationController
    def index
     @assignments = Assignment.all
   end
   
   
   def show
     @assignment = Assignment.find(params[:id])
   end

 def new
     @assignment = Assignment.new
   end  

   def create
     @assignment = Assignment.new
     @assignment.name = params[:assignment][:name]
     @assignment.description = params[:assignment][:description]
     @assignment.public = params[:assignment][:public]
 
     if @assignment.save
       flash[:notice] = "Assignment was saved successfully."
       redirect_to @assignment
     else
       flash.now[:alert] = "Error creating assignment. Please try again."
       render :new
     end
   end
   
     def edit
     @assignment = Assignment.find(params[:id])
   end
 
 def update
     @assignment = Assignment.find(params[:id])
 
     @assignment.name = params[:assignment][:name]
     @assignment.description = params[:assignment][:description]
     @assignment.public = params[:assignment][:public]
 
     if @assignment.save
        flash[:notice] = "Assignment was updated successfully."
       redirect_to @assignment
     else
       flash.now[:alert] = "Error saving assignment. Please try again."
       render :edit
     end
   end
   
   def destroy
     @assignment = Topic.find(params[:id])
 
     if @assignment.destroy
       flash[:notice] = "\"#{@assignment.name}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the assignment."
       render :show
     end
   end
end
