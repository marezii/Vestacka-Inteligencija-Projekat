(defstruct byte
    matrix
    matSize
)

(defun byteGame ()
    (setq n (read))
    (setq byte-matSize n)
    (if (eq (mod byte-matSize '2) '0) (draw byte-matSize) (byteGame)
    )
)

(defun draw (matSize)
  (cond 
      ((>= matSize 0) (draw (- matSize 1)) (format t "~a            " matSize))
  )
)

;This is just a test on line 19.

(defun stampaj (stanje)
(format t "~%~a ~a ~a~%" (nth 0 stanje)
(nth 1 stanje) (nth 2 stanje))
(format t "~a ~a ~a~%" (nth 3 stanje)
(nth 4 stanje) (nth 5 stanje))
(format t "~a ~a ~a~%" (nth 6 stanje)
(nth 7 stanje) (nth 8 stanje)))

(byteGame)