module ApplicationHelper
  def pluralize(value, string)
    "#{value} " << (value > 1 ? string.pluralize : string)
  end
end
