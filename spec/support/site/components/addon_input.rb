class AddonInput < Peek::Component
  select_by class: /^components-AddonInput/, visible: true

  def set(value)
    input.set(value)
  end
  alias_method :update, :set
end
