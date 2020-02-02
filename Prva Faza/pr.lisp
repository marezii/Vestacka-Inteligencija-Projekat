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
    (cond 
        ((< counter '0) '())
        ((eq (mod counter 3) 1)(format t "~%~a " (car letterList))     (drawRow (* 3 byte-matSize) counter) (printBord (cdr letterList) (- counter 1)))
        ;; ((and (eq (mod counter 3) 0) (> counter 0)) (setq bitColor (not bitColor)))
        (t (format t "~%  ")     (drawRow (* 3 byte-matSize) counter) (printBord letterList (- counter 1)))
    )

    
    
    
        ;; (dotimes (i counter)

        ;; (if )  

        ;; )
            
        ;; (dotimes (j byte-matSize)
        ;;     (if (eq bitColor nil)
        ;;         (printBlackFirst state (car letterList))
        ;;         (printWhiteFirst)
        ;;     )
            
        ;; )
            
    
)

(defun drawRow (count counter)
    (cond 
        ((eq bitColor nil) (drawBlackFrist count)) 
        (t (drawWhiteFirst count)) 
    )
)

(defun drawBlackFrist (count)
    (cond
        ((< count '0) '())
        ((eq bitColor nil)(format t " - - - ")  (setq bitColor (not bitColor))(drawBlackFrist (- count 3)))
        (t (format t "       ") (setq bitColor (not bitColor)) (drawBlackFrist (- count 3)))
    )
)

(defun drawWhiteFirst (count)
    (cond
        ((< count '0) '())
        ((eq bitColor t)(format t "       ") (setq bitColor (not bitColor)) (drawWhiteFirst (- count 3)))
        (t (format t " - - - ") (setq bitColor (not bitColor)) (drawWhiteFirst (- count 3)))
    )
)

;; (setq initialState ((A 1)() (A 3)() (A 5)() (A 7) () ((B 2)(-----)))
;; (trace printBord)
 (byteGame)

