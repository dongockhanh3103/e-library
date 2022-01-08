# == Schema Information
#
# Table name: combos
#
#  id         :bigint           not null, primary key
#  book_id    :bigint
#  song_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Combo < ApplicationRecord
end
