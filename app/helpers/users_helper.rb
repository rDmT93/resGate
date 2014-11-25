module UsersHelper
  def button_class(is_follow)
    case is_follow
      when false then "btn-success"
      when true then "btn-default"
    end
  end

  def button_text(is_follow)
    case is_follow
      when false then "Follow"
      when true then "Unfollow"
    end
  end

  def name(is_follow )
    case is_follow
      when false then "f"
      when true then "u"
    end
  end
end

