require 'rails_helper'

describe BooksController.class.name, type: :request do
  let!(:label) { create(:label) }
  let!(:books) { create_list(:book, 5, label: label) }

  context 'when get list books successfully' do
    it 'with existing books' do
      get '/v1/books'

      body = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(body['data'].size).to eq(5)
    end
  end

  context 'when get book successfully' do
    it 'with existing book' do
      get "/v1/books/#{books.first.id}"
    
      body = JSON.parse(response.body)
      book = books.first
      expect(response).to have_http_status(:success)
      expect(body['data']['attributes']['name']).to eq(book.name)
      expect(body['data']['attributes']['description']).to eq(book.description)
      expect(body['data']['attributes']['label']['name']).to eq(label.name)
    end
  end

  context 'when create book' do
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

    it 'will create book successfully' do
      post '/v1/books', params: params

      body = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(body['data']['attributes']['name']).to eq(params[:data][:attributes][:name])
      expect(body['data']['attributes']['label']['id']).to eq(params[:data][:attributes][:label_id])
    end

    it 'will create book failure' do
      create(:book, name: name_failure)
      post '/v1/books', params: params

      expect(response).to have_http_status(422)
    end
  end
end
