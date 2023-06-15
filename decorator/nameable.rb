class Nameable
  def correct_name?
    raise NotImplementedError "#{self.class} This method should be implemented in the child class"
  end
end
