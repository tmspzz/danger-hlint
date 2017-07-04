module HaskellTestFile where



foo :: [[a]] -> [a]
foo xs = concat (map id xs)
