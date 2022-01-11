require 'rails_helper'

describe Songs::CreateService do
  context 'when create song successfully' do
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

  context 'when create song failure' do
    let!(:label) { create(:label) }
    let!(:name) { Faker::Name.unique.name }
    let!(:song) { create(:song, name: name) }
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