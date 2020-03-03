ActiveAdmin.register StandardSurvey do
  actions :index, :show

  controller do
    def scoped_collection
      super.includes :patient
    end
  end

  index do
    id_column
    column :patient
    column :body_temperature
    column :created_at
    column :completed_at
    actions
  end

  filter :patient_id
  filter :body_temperature
  filter :completed_at
  filter :created_at

  action_item(:edit_standard_survey, only: :show) do
    link_to 'Remplir le formulaire', edit_standard_survey_url(id: standard_survey.public_token, otp: standard_survey.patient.generate_otp), target: '_blank'
  end

end