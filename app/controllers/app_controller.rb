class AppController < ApplicationController
  def index
    @employee = Employee.new
    employees = Employee.where("level < 3")
    @free = []
    if !employees.empty?
      employees.each do|e| 
        if e.links.length < 3
          @free.push(["#{e.fname} #{e.lname}", e.id])
        end
      end
    end
  end

  def create
    refererId = params[:employ][:reference]
    referer = nil
    employee = nil

    fname = params[:employ][:fname].strip.capitalize
    lname = params[:employ][:lname].strip.capitalize
    email = params[:employ][:email].strip.capitalize

    if refererId
      referer = Employee.find(refererId)
      employee = Employee.new(fname: fname, lname: lname, email: email, level: referer.level+1)
      employee.save
      referer.links.build(reference: employee.id).save
      flash[:notice] = "Registration Successful"
      redirect_to root_path
    else
      if !Employee.select('id').where("level == 0").empty?
        @employ = Employee.new(fname: fname, lname: lname, email: email, level: 0)
        employees = Employee.where("level < 3")
        @free = []
        if !employees.empty?
          employees.each do|e| 
            if e.links.length < 3
              @free.push(["#{e.fname} #{e.lname}", e.id])
            end
          end
        end
        flash.now[:error] = "The system can no longer accept any more registration as the third generation is filled"
        render 'index'
      else
        employee = Employee.new(fname: fname, lname: lname, email: email, level: 0)
        employee.save
        flash[:notice] = "Registration Successful"
        redirect_to root_path
      end
    end
  end
  def red
    redirect_to root_path
  end
end
