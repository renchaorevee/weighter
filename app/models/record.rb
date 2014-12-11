class Record < ActiveRecord::Base
  validates :date, presence: true
  validates :weight, presence: true, numericality: {greater_than: 0, less_than: 250}
  validate :date_cannot_be_in_the_future

  after_initialize :init
  belongs_to :user

  def init
    self.date ||= Date.today
    self.weight ||= 50
  end

  def date_cannot_be_in_the_future
    if date.present? && date > Date.today
      errors.add(:date, "can't be in the future")
    end
  end
end
