module MessagesHelper
  def new_msg(is_new_msg)
    case is_new_msg
      when true then "no_new_msg"
      when false then "new_msg"
    end
  end
end
