(defstruct byte
    matrix ; (- X X X O O O O)
    matSize
    placeInStack ;(A 1)
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
                (printBlackFirst state (car letterList))
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

;; (setq initialState ((A 1)() (A 3)() (A 5)() (A 7) () ((B 2)(-----)))

;; (trace printBord)
(write (car (-)))

