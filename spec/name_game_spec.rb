require 'game'

RSpec.describe Game do
  
  # Shirley!                                           # Digraph Rule SH
  # Shirley, Shirley bo Birley Bonana fanna fo Firley  # Digraph Rule SH
  # Fee fy mo Mirley, Shirley!                         # Digraph Rule SH
  #
  # Lincoln!                                              # Normal
  # Lincoln, Lincoln bo Bincoln Bonana fanna fo Fincoln   # Normal
  # Fee fy mo Mincoln, Lincoln!                           # Normal
  #
  # Come on everybody!
  # I say now let's play a game
  # I betcha I can make a rhyme out of anybody's name
  # The first letter of the name, I treat it like it wasn't there
  # But a B or an F or an M will appear
  # And then I say bo add a B then I say the name and Bonana fanna and a
  # fo
  # And then I say the name again with an F very plain
  # and a fee fy and a mo
  # And then I say the name again with an M this time
  # and there isn't any name that I can't rhyme
  #
  # Arnold!                                            # Vowel Rule
  # Arnold, Arnold bo Barnold Bonana fanna fo Farnold  # Vowel Rule
  # Fee fy mo Marnold Arnold!                          # Vowel Rule
  #
  # But if the first two letters are ever the same,
  # I drop them both and say the name like
  # Bob, Bob drop the B's Bo -ob                        # Drop Both Double
  # For Fred, Fred drop the F's Fo -red                 # Drop Both Double * Keep Second Consonant (Implies FRED -> BO-BED/FO-RED/MO-MED)
  # For Mary, Mary drop the M's Mo -dary                # Drop Both Double * Add a D cause fuck it (Implies MARY -> BO-BARY/FO-FARY/MO-DARY)
  # That's the only rule that is contrary.             
  #
  # Okay? Now say Bo: Bo
  # Now Tony with a B: Bony
  # Then Bonana fanna fo: bonana fanna fo
  # Then you say the name again with an F very plain: Fony
  # Then a fee fy and a mo: fee fy mo
  # Then you say the name again with an M this time: Mony
  # And there isn't any name that you can't rhyme
  #
  # Every body do Tony!                                # NORMAL
  # Tony, Tony bo Bony Bonana fanna fo Fony            # NORMAL
  # Fee fy mo Mony, Tony!                              # NORMAL
  #
  # Pretty good, let's do Billy!                       # Drop Both Double
  # Billy, Billy Bo-illy Bonana fanna fo Filly         # Drop Both Double
  # Fee fy mo Milly, Billy!                            # Drop Both Double
  #
  # Very good, let's do Marsha!                        # Drop Both Double *
  # Marsha, Marsha bo Barsha Bonana fanna fo Farsha    # Drop Both Double *
  # Fee fy Mo-darsha, Marsha!                          # Drop Both Double *
  #
  # A little trick with Nick!                          # NORMAL
  # Nick, Nick bo Bick Bonana fanna fo Fick            # NORMAL
  # Fee fy mo Mick, Nick!                              # NORMAL
  #
  # The name game

  # Main Suite
  
  # GIVEN         | YIELD
  # Shirley       | Shirley, Shirley BO B-irley  BONANA FANNA FO F-irley  / FEE FY MO M-irley , Shirley!
  # Lincoln       | Lincoln, Lincoln BO B-incoln BONANA FANNA FO F-incoln / FEE FY MO M-incoln, Lincoln!
  # Arnold        | Arnold , Arnold  BO B-arnold BONANA FANNA FO F-arnold / FEE FY MO M-arnold, Arnold! 
  # Fred          | Fred   , Fred    BO B-red    BONANA FANNA FO R-ed     / FEE FY MO M-red   , Fred!        --- yep... mred
  # Bob           | Bob    , Bob     BO  -ob     BONANA FANNA FO F-ob     / FEE FY MO M-ob    , Bob!
  # Mary          | Mary   , Mary    BO B-ary    BONANA FANNA FO F-ary    / FEE FY MO  -ary   , Mary!
  # Tony          | Tony   , Tony    BO B-ony    BONANA FANNA FO F-ony    / FEE FY MO M-ony   , Tony!
  # Billy         | Billy  , Billy   BO  -illy   BONANA FANNA FO F-illy   / FEE FY MO M-illy  , Billy!
  # Marsha        | Marsha , Marsha  BO B-arsha  BONANA FANNA FO F-arsha  / FEE FY MO  -arsha , Marsha!
  # Nick          | Nick   , Nick    BO B-ick    BONANA FANNA FO F-ick    / FEE FY MO M-ick   , Nick!
  
  before(:each) do
    @game = Game.new
  end
  
  describe "#play" do
    
    [
      ["Shirley", "Shirley, Shirley BO Birley BONANA FANNA FO Firley / FEE FY MO Mirley, Shirley!"],
      ["Lincoln", "Lincoln, Lincoln BO Bincoln BONANA FANNA FO Fincoln / FEE FY MO Mincoln, Lincoln!"],
      ["Arnold" , "Arnold, Arnold BO Barnold BONANA FANNA FO Farnold / FEE FY MO Marnold, Arnold!"],
      ["Fred", "Fred, Fred BO Bred BONANA FANNA FO red / FEE FY MO Mred, Fred!"],
      ["Foggy", "Foggy, Foggy BO Boggy BONANA FANNA FO oggy / FEE FY MO Moggy, Foggy!"],
      ["Bob", "Bob, Bob BO ob BONANA FANNA FO Fob / FEE FY MO Mob, Bob!"],
      ["Mary", "Mary, Mary BO Bary BONANA FANNA FO Fary / FEE FY MO ary, Mary!"],
      ["Tony", "Tony, Tony BO Bony BONANA FANNA FO Fony / FEE FY MO Mony, Tony!"],
      ["Billy"  , "Billy, Billy BO illy BONANA FANNA FO Filly / FEE FY MO Milly, Billy!"],
      ["Marsha" , "Marsha, Marsha BO Barsha BONANA FANNA FO Farsha / FEE FY MO arsha, Marsha!"],
      ["Nick", "Nick, Nick BO Bick BONANA FANNA FO Fick / FEE FY MO Mick, Nick!"],
      ["Thingy", "Thingy, Thingy BO Bingy BONANA FANNA FO Fingy / FEE FY MO Mingy, Thingy!"],
    ].each do |pair|
      name, expected_song = *pair
      
      it "generates the correct song for #{name}" do
        expect(@game.play(name).gsub(/\s+/,' ')).to eq(expected_song)
      end
      
    end
    
  end
    
  
end
