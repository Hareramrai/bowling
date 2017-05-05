class Game

  def initialize 
    @scores = 0
    @current_roll = 0
    @rolls_arr =  Array.new(21) {|i| 0 }
  end

  def roll pins
    @rolls_arr[@current_roll] = pins
    @current_roll += 1
  end

  def score 
    frame_index, i  = 0, 0 
    frame = 0

    while frame < 10  do
      if is_strike(frame_index)
        @scores += 10 + strike_bonus(frame_index)
        frame_index += 1
      elsif  is_spare frame_index 
        @scores += 10 + spare_bonus(frame_index)
        frame_index += 2
      else
        @scores += sum_of_balls_in_frame(frame_index)
        frame_index += 2
      end
      frame += 1
    end

    @scores
  end 

  private 

  def is_spare frame_index
    @rolls_arr[frame_index] + @rolls_arr[frame_index + 1] == 10
  end
  def is_strike frame_index
    @rolls_arr[frame_index] == 10 
  end
  def strike_bonus frame_index
    @rolls_arr[frame_index + 1] + @rolls_arr[frame_index+2]
  end

  def spare_bonus frame_index
     @rolls_arr[frame_index+2]
  end

  def sum_of_balls_in_frame frame_index
    @rolls_arr[frame_index]+@rolls_arr[frame_index+1]
  end

end