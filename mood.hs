module MoodM where

data Mood = Blah | Well | Woot deriving Show
changeMood :: Mood -> Mood
changeMood Well = Woot
changeMood _ = Blah
