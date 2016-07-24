# == Schema Information
#
# Table name: sites
#
#  id           :integer          not null, primary key
#  category_id  :integer
#  sort         :integer
#  title        :string
#  body         :text
#  visible      :boolean          default(FALSE)
#  published_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Site < ApplicationRecord
  belongs_to_active_hash :category, shortcuts: [:code, :name]
end
