require 'rails_helper'

describe LabelsController.class.name, type: :request do
  let!(:labels) { create_list(:label, 5) }

  context 'when get list labels successfully' do
    it 'with existing labels' do
      get '/v1/labels'

      body = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(body['data'].size).to eq(5)
    end
  end

  context 'when get label successfully' do
    it 'with existing label' do
      get "/v1/labels/#{labels.first.id}"
    
      body = JSON.parse(response.body)
      label = labels.first
      expect(response).to have_http_status(:success)
      expect(body['data']['attributes']['name']).to eq(label.name)
      expect(body['data']['attributes']['description']).to eq(label.description)
    end
  end

  context 'when get most popular labels successfully' do
    let!(:most_poplar_label) { create(:label) }
    let!(:not_poplar_label) { create(:label) }
    let!(:books) { create_list(:book, 5, label: most_poplar_label) }

    before do
      books.each do |book|
        create(:items_label, :book, label_id: most_poplar_label.id, source_id: book.id)
      end
    end

    it 'most popular label' do
      get '/v1/labels/most_popular'

      body = JSON.parse(response.body)
      expect(body['data'].size).to eq(1)
    end
  end
end
