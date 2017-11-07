class Todo < ApplicationRecord

  validates_presence_of :name, :due_date, :note

  def is_due_date_over
    date = Time.new.to_s
    year, month, day = date.split(/-/)

    today=year + "-" + month + "-" + day
    # date = Time.new.to_s
    due_date_s = due_date.to_s
    if due_date_s <= today
      true
    else
      false
    end
  end
    
end
