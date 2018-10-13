class Datepicker < Peek::Component
  select_by class: "react-datepicker__input-container", visible: true

  def set(datestr)
    input.click
    input.set datestr + "\t"
  end
  alias_method :update, :set
end
