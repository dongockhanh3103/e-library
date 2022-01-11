# frozen_string_literal: true

# == Schema Information
#
# Table name: labels
#
#  id          :bigint           not null, primary key
#  name        :string(100)      default("")
#  description :text             default("")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Label < ApplicationRecord

  include LibraryValidation

end
