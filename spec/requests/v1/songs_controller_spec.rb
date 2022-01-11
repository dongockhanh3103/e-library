require 'rails_helper'

describe SongsController.class.name, type: :request do
  let!(:label) { create(:label) }
  let!(:songs) { create_list(:song, 5, label: label) }
  context 'when get list songs successfully' do
    it 'with existing songs' do
      get '/v1/songs'

      body = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(body['data'].size).to eq(5)
    end
  end

  context 'when get song successfully' do
    it 'with existing song' do
      get "/v1/songs/#{songs.first.id}"
    
      body = JSON.parse(response.body)
      song = songs.first
      expect(response).to have_http_status(:success)
      expect(body['data']['attributes']['name']).to eq(song.name)
      expect(body['data']['attributes']['description']).to eq(song.description)
      expect(body['data']['attributes']['label']['name']).to eq(label.name)
    end
  end

  context 'when create song' do
    let(:name_failure) { Faker::Name.unique.name }
    let(:params) do
      {
        data: {
          attributes: {
            name: name_failure ,
            description: Faker::Lorem.sentence,
            label_id: label.id
          }
        }
      }
    end

    it 'will create song successfully' do
      post '/v1/songs', params: params

      body = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(body['data']['attributes']['name']).to eq(params[:data][:attributes][:name])
      expect(body['data']['attributes']['label']['id']).to eq(params[:data][:attributes][:label_id])
    end

    it 'will create song failure' do
      create(:song, name: name_failure)
      post '/v1/songs', params: params

      expect(response).to have_http_status(422)
    end
  end
end
