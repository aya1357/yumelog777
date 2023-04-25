class CharacterComment
  TEXT1 = "test1"
  TEXT2 = "test2"

  def get_character_comment(random_number)
    case random_number
    when 1 then
      return TEXT1
    when 2 then
      return TEXT2
    end
  end
end
