class Game

  def initialize 
    @scores = 0
    @current_roll = 0
    @rolls_arr = []
  end

  def roll pins
    @rolls_arr[@current_roll] = pins
    @current_roll += 1
  end

  def score 
    frame_index, i  = 0, 0 
    frame = 0

    while frame < 10  do

      if  is_spare frame_index 
        @scores += 10 + @rolls_arr[frame_index+2]
        frame_index += 2
      else
        @scores += @rolls_arr[frame_index] + @rolls_arr[frame_index+1]
        frame_index += 2
      end
      frame += 1
    end

    @scores
  end 

  private 

  def is_spare frame_index
    @rolls_arr[frame_index] + @rolls_arr[frame_index + 1] == 10;
  end

end
