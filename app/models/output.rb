class Output < ApplicationRecord
  belongs_to :user
  belongs_to :source
  belongs_to :batch

  FONTFAMILIES = ["Georgia", "Serif", "Cursive"]
  # validates :font_family, presence: true, inclusion: { in: FONTFAMILIES }
  FONTSTYLES = ["Normal", "Italic", "Bold"]
  # validates :font_style, presence: true, inclusion: { in: FONTSTYLES }
  # validates :script, presence: true
  VOICES = [1, 2, 3]
  # validates :voice, presence: true, inclusion: { in: VOICES }


  VIDEOS = ["vid1", "vid2", "vid3", "vid4"]
end
