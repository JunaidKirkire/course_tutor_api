require 'rails_helper'

RSpec.describe "Courses", type: :request do
  describe "POST /courses" do
    let(:valid_attributes) do
      {
        course: {
          name: 'Ruby on Rails',
          tutors_attributes: [
            { name: 'John Wayne' },
            { name: 'Jane Smith' }
          ]
        }
      }
    end

    let(:invalid_attributes) do
      {
        course: {
          name: '',
          tutors_attributes: [
            { name: 'John Wayne' },
            { name: 'Jane Smith' }
          ]
        }
      }
    end

    it "creates a new Course with Tutors" do
      expect {
        post courses_path, params: valid_attributes
      }.to change(Course, :count).by(1)
      .and change(Tutor, :count).by(2)
      json = JSON.parse(response.body)
      expect(response).to have_http_status(:created)
      json = JSON.parse(response.body)
      expect(json['name']).to eq('Ruby on Rails')
      expect(json['tutors'].map { |t| t['name'] }).to include('John Wayne', 'Jane Smith')
    end

    it "returns an error for invalid attributes" do
      post courses_path, params: invalid_attributes
      expect(response).to have_http_status(:unprocessable_entity)
      json = JSON.parse(response.body)
      expect(json['errors']).to include("Name can't be blank")
    end

    let!(:existing_tutor) { create(:tutor, name: 'John Doe', course: create(:course, name: 'Existing Course')) }

    it "returns an error if a tutor is already assigned to another course" do
      post courses_path, params: {
        course: {
          name: 'New Course',
          tutors_attributes: [
            { name: 'John Doe' }
          ]
        }
      }
      expect(response).to have_http_status(:unprocessable_entity)
      json = JSON.parse(response.body)
      expect(json['errors']).to include("Tutors name has already been taken")
    end
  end

  describe "GET /courses" do
    let!(:course) { create(:course, name: 'Ruby on Rails') }
    let!(:tutor1) { create(:tutor, name: 'John Doe', course: course) }
    let!(:tutor2) { create(:tutor, name: 'Jane Smith', course: course) }

    it "returns a list of courses with their tutors" do
      get courses_path
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json.first['name']).to eq('Ruby on Rails')
      expect(json.first['tutors'].map { |t| t['name'] }).to include('John Doe', 'Jane Smith')
    end
  end
end
