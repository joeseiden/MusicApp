# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  title      :string
#  album_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  belongs_to :album

  has_one :band,
    through: :album,
    source: :band
end
