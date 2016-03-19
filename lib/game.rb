class Game
  def play(name)
    @name = name
    "#{@name}, #{@name} BO #{b_name} BONANA FANNA FO #{f_name} / FEE FY MO #{m_name}, #{@name}!"
  end
  
  private 

  %w(b f m).each do |letter|
    define_method "#{letter}_name" do               # def x_name
      replace_first_letter(letter.upcase)           #   replace_first_letter(x.upcase)
    end                                             # end
  end

    # def b_name
    #   replace_first_letter("B")
    # end
    #
    # def f_name
    #   replace_first_letter("F")
    # end
    #
    # def m_name
    #   replace_first_letter("M")
    # end
    
    def replace_first_letter(letter)
      initial_letter(letter) + trailing_name(letter)
    end

    def initial_letter(letter)
      if @name.start_with? letter
        ''
      else
        letter
      end
    end

    def trailing_name(letter)
      if @name =~ /\A[AEIOU]/i
        @name.downcase
      else
        @name.partition(/(sh|th|ch|[a-z])/i)[2]
      end
    end
    
end
