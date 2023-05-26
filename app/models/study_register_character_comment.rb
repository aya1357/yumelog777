class StudyRegisterCharacterComment
  TEXT1 = "がんばって！"
  TEXT2 = "応援してる！"
  TEXT3 = "ファイト！！"
  TEXT4 = "チャレンジ！"
  TEXT5 = "絶対達成！！"
  TEXT6 = "一球入魂！！"
  TEXT7 = "諦めないで！"
  TEXT8 = "行け行け！！"
  TEXT9 = "目指せ読破！"
  TEXT10 = "やり抜いて！"

  def get_study_register_character_comment(random_number)
    case random_number
    when 1 then
      return TEXT1
    when 2 then
      return TEXT2
    when 3 then
      return TEXT3
    when 4 then
      return TEXT4
    when 5 then
      return TEXT5
    when 6 then
      return TEXT6
    when 7 then
      return TEXT7
    when 8 then
      return TEXT8
    when 9 then
      return TEXT9
    when 10 then
      return TEXT10
    end
  end
end
