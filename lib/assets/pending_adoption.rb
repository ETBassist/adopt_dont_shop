class PendingAdoption
  def current_status
    "Adoption Pending"
  end

  def path_switch
    "adoptable"
  end

  def inverse_status
    path_switch.capitalize
  end
end
