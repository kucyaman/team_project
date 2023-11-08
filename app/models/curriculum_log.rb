class CurriculumLog < ApplicationRecord
  belongs_to :user
  belongs_to :curriculum
  before_save :escape_body

  validates :title, presence: true, length: { maximum: 140 }
  validates :hour, presence: true
  validates :minutes, presence: true

  def self.ransackable_attributes(auth_object = nil)
    super & %w(body chapter_id created_at curriculum_id hour minutes title updated_at user_id)
  end
  
  def self.ransackable_associations(auth_object = nil)
    %w(curriculum chapter)
  end

  private

  def escape_body
    # コードブロックを保持
    code_blocks = []
    self.body = self.body.gsub(/```(.*?)```/m) do
      code_blocks << $1
      "CODEBLOCKMARKER#{code_blocks.length - 1}"
    end
  
    # バッククォートで囲まれたテキストを一時的にマーキング
    inline_code = []
    self.body = self.body.gsub(/`([^`]+)`/) do
      inline_code << $1
      "INLINECODEMARKER#{inline_code.length - 1}"
    end
  
    # 本文をエスケープ
    self.body = ERB::Util.html_escape(self.body)
  
    # コードブロックを元に戻す
    code_blocks.each_with_index do |code_block, index|
      self.body.gsub!("CODEBLOCKMARKER#{index}", "```#{code_block}```")
    end
  
    # バッククォートで囲まれたテキストを元に戻す
    inline_code.each_with_index do |code_text, index|
      self.body.gsub!("INLINECODEMARKER#{index}", "`#{code_text}`")
    end
  end
  
  
end
