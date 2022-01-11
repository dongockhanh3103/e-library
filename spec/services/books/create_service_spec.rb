require 'rails_helper'

describe Books::CreateService do
  context 'when create book successfully' do
    let!(:label) { create(:label) }
    let!(:name) {  Faker::Name.unique.name }
    let(:params) do
      {
        name: name,
        description: Faker::Lorem.sentence,
        label_id: label.id
      }
    end

    it 'will create successfully' do
      result = described_class.execute(params)

      expect(result.success).to be(true)
      expect(result.record.name).to eq(params[:name])
    end
  end

  context 'when create book failure' do
    let!(:label) { create(:label) }
    let!(:name) { Faker::Name.unique.name }
    let!(:book) { create(:book, name: name) }
    let(:params) do
      {
        name: name,
        description: Faker::Lorem.sentence,
        label_id: label.id
      }
    end

    it 'will create successfully' do
      result = described_class.execute(params)

      expect(result.success).to be(false)
    end
  end
end