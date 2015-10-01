class Question

  attr_reader :number_1, :number_2, :correct_answer

  def initialize
    @number_1 = rand(1..20)
    @number_2 = rand(1..20)
    @correct_answer = @number_1 + @number_2
  end

end