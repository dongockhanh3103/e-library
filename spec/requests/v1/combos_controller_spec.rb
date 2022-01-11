require 'rails_helper'

describe CombosController.class.name, type: :request do
  let!(:label) { create(:label) }
  let!(:label_for_combo) { create(:label) }
  let!(:book) { create(:book, label: label) }
  let!(:song) { create(:song, label: label) }
  context 'when get list combos successfully' do
    let!(:combo) { create(:combo, book: book, song: song, label: label_for_combo) }

    it 'with existing combos' do
      get '/v1/combos'

      body = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(body['data'].size).to eq(1)
    end
  end

  context 'when create combo' do
    let!(:params) do
      {
        data: {
          attributes: {
            book_id: book.id,
            song_id: song.id,
            label_id: label.id
          }
        }
      }
    end

    it 'create combo successfully' do
      post '/v1/combos', params: params

      body = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
    end
  end
end
