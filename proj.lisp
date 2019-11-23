(defstruct byte
    matrix
    listField
    matSize
    placeInStack
)

(setq letterList '(A B C D E F G H I J))
(setq bitColor nil)
(setq byte-matSize (read))
(setq  counter (* byte-matSize 3))


(defun byteGame ()
    (cond 
        ((or (eq byte-matSize '8)(eq byte-matSize '10)) (writeBordNumbers byte-matSize) (format t "~%")(printBord letterList counter)) 
        (:else (setq byte-matSize (read)))
        

    )
    
)

(defun writeBordNumbers (matSize)
    (cond 
        ((> matSize 0) (writeBordNumbers (- matSize 1)) (format t "    ~a" matSize))
        
    )
)

(defun printBord (letterList counter)
    (dotimes (i counter)

        (if (and (eq (mod i 3) 0) (> i 0))
                (setq bitColor (not bitColor))  

        )
        (cond 
            ((eq (mod i 3) 1)(format t "~%~a " (car letterList)) (setq letterList (cdr letterList)))
            ((format t "~%  "))
        )
            
      
        (dotimes (j byte-matSize)
            (if (eq bitColor nil)
                (printBlackFirst)
                (printWhiteFirst)
            )
            
        )
            
    )
)

(defun printBlackFirst ()
    (format t "- - -")
    (setq bitColor (not bitColor))
)

(defun printWhiteFirst ()
    (format t "     ")
    (setq bitColor (not bitColor))
)

;; (trace printBord)
(byteGame)

