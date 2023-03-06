
class Question

  attr_reader :first_random_number, :second_random_number, :answer

  def initialize()
    @first_random_number = rand(1..10)
    @second_random_number = rand(1..10)
    @answer = first_random_number + second_random_number
  end

  def is_correct?(answer)
    return answer == @answer
  end

end
