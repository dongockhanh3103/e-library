require 'rails_helper'

describe Labels::MostPopularService do
  context 'When return the most popular labels ' do
    let!(:most_poplar_label) { create(:label) }
    let!(:not_poplar_label) { create(:label) }
    let!(:books) { create_list(:book, 5, label: most_poplar_label) }

    before do
      books.each do |book|
        create(:items_label, :book, label_id: most_poplar_label.id, source_id: book.id)
      end
    end

    it 'will return the list successfully' do
      result = described_class.execute

      expect(result.count).to be(1)
    end
  end
end