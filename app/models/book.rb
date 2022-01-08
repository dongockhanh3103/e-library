# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  name        :string(100)      default("")
#  description :text             default("")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Book < ApplicationRecord
  include LibraryValidation
end
