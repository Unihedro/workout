(defn easyAssignmentProblem [x] 
  (if (> (+ (get (get x 0) 0) (get (get x 1) 1)) (+ (get (get x 0) 1) (get (get x 1) 0)))
    (list 1 2)
    (list 2 1))
  )
