class PatientsController < ApplicationController
  def new
    @patient = Patient.new
  end

  def index
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to @patient
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :gender, :BSN, :date_of_birth,
                                    :address, :postal_code, :place_of_residence, :phone_number,
                                    :email, :insurance_company, :policy_number)
  end

end
