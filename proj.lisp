(defstruct byte
    matrix
    listField
    matSize
    placeInStack
)

(setq byte-matSize (read))
(defun byteGame ()
    (cond 
        ((or (eq byte-matSize '8)(eq byte-matSize '10)) (writeBordNumbers byte-matSize)) 
        ((setq byte-matSize (read)))
    )
)

(defun writeBordNumbers (matSize)
    (cond 
        ((>= matSize 0) (writeBordNumbers (- matSize 1)) (format t "    ~a  " matSize))
        (t (printBord letterList counter))
    )
)

(defun printStack ()
(format t "~%   ~%")
(format t "   ~%")
(format t "   ~%" )
(format t "~a~%" "kraj")
)

(setq letterList '(A B C D E F G H I J))

(setq bitColor nil)
(setq  counter 0)
(setq  ls '())
(defun printBord (letterList counter)
        (if (eq counter (* (* 3 byte-matSize) (* 3 byte-matSize))) '())
        (if (eq (mod counter 3) 1) (format t " ~a " (car letterList)) (format t "   "))
        (if (eq (mod counter 24) '0) (format t "~%"))
        (if (eq nil bitColor) (format t "---") (format t "   "))
        (printBord (cdr letterList) (+ 1 counter))
    
)

;(trace printBord)
(printStack)
