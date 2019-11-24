(defstruct byte
    matrix ; (- X X X O O O O)
    matSize
    placeInStack ;((1 1) (0 2 3 25 26 27 49 50 51))
)

(setq letterList '((A 1) (B 2) (C 3) (D 4) (E 5) (F 6) (G 7) (H 8) (I 9) (J 10)))
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
        ((> matSize 0) (writeBordNumbers (- matSize 1)) (format t "      ~a  " matSize))
        
    )
)
 ;(print (cadr (assoc (caar letterList) letterList)))
(defun printBord (letterList counter)
    
    (cond 
        ((eq counter '0) '())
        ((eq (mod counter 3) 2)
            (format t "~%~a " (car (assoc (caar letterList) letterList)))
            (drawRow (* 3 byte-matSize) (cadr (assoc (caar letterList) letterList)) byte-matSize) 
            (printBord letterList (- counter 1)))
        ((eq (mod counter 3) 1)
            (format t "~%  " (car (assoc (caar letterList) letterList)))
            (drawRow (* 3 byte-matSize) (cadr (assoc (caar letterList) letterList)) byte-matSize) 
            (printBord (cdr letterList) (- counter 1)))
        (t (format t "~%  ")     
            (drawRow (* 3 byte-matSize) (cadr (assoc (caar letterList) letterList)) byte-matSize) 
            (printBord letterList (- counter 1)))
    )
    
)

(defun drawRow (cnt letterNo btSize &optional (n 3) )
    (cond 
    ((eq n '0)(setq btSize (- btSize 1))(setq n 3))
    )
    (cond 
        ((eq cnt '0) '())
        ((eq (mod (+ letterNo btSize) '2) '0) 
            (format t "   ") 
            (drawRow (- cnt 1) letterNo btSize (- n 1))) 
        (t  (format t " - ") 
            (drawRow (- cnt 1) letterNo btSize (- n 1))) 
    )
)

;; (defun drawBlackFrist (count)
;;     (cond
;;         ((< count '0) '())
;;         ((eq bitColor nil)(format t " - - - ")  (setq bitColor (not bitColor))(drawBlackFrist (- count 3)))
;;         (t (format t "       ") (setq bitColor (not bitColor)) (drawBlackFrist (- count 3)))
;;     )
;; )

;; (defun drawWhiteFirst (count)
;;     (cond
;;         ((< count '0) '())
;;         ((eq bitColor t)(format t "       ") (setq bitColor (not bitColor)) (drawWhiteFirst (- count 3)))
;;         (t (format t " - - - ") (setq bitColor (not bitColor)) (drawWhiteFirst (- count 3)))
;;     )
;; )

;; (setq initialState ((A 1)() (A 3)() (A 5)() (A 7) () ((B 2)(-----)))
;; (trace drawRow)
(byteGame)


