# == Schema Information
#
# Table name: songs
#
#  id          :bigint           not null, primary key
#  name        :string(100)      default("")
#  description :text             default("")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Song < ApplicationRecord
  include LibraryValidation
end
