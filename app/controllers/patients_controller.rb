class PatientsController < ApplicationController
  def new
    @patient = Patient.new
  end

  def index
    @patients=Patient.all
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
    @patient = Patient.find(params[:id])
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update_attributes(patient_params)
      # Handle a successful update.
    else
      render 'edit'
    end
    redirect_to @patient
  end

  def destroy
    Patient.find(params[:id]).destroy
    flash[:success] = "Patient deleted"
    redirect_to patients_url

  end

  private
  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :gender, :BSN, :date_of_birth,
                                    :address, :postal_code, :place_of_residence, :phone_number,
                                    :email, :insurance_company, :policy_number)
  end

end
