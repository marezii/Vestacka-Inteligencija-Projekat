(defstruct byte
    state ; (- X X X O O O O)
    matSize
)

; ((A 1 (1 (- X X O X X X) )) ))

;; (setq letterList '((A 1) (B 2) (C 3) (D 4) (E 5) (F 6) (G 7) (H 8) (I 9) (J 10)))
(setq letterList '((J 10) (I 9) (H 8) (G 7) (F 6) (E 5) (D 4) (C 3) (B 2)(A 1)))

(print "Unesite velicinu polja")
(setq byte-matSize (read))

(setq  counter (* byte-matSize 3))

(print "Da li zelite da igrate prvi? 1 za da 0 za ne")
(setq firstPlayer (read))

(setq byte-state '())

(setq humanState8'( ((A 1) 
                     ((1 (X - - O - - X - -)) 
                     (3 (- - - - - - - - -))
                     (5 (- - - - - - - - -))
                     (7 (- - - - - - - - -))))
                    ((B 2) 
                     ((2 (- - - - - - - - O))
                     (4 (- - - - - - - - O))
                     (6 (- - - - - - - - O))
                     (8 (- - - - - - - - O))))
                    ((C 3) 
                    ((1 (- - - - - - - - X))
                     (3 (- - - - - - - - X))
                     (5 (- - - - - - - - X))
                     (7 (- - - - - - - - X))))

                    ((D 4) 
                     ((2 (- - - - - - - - O))
                     (4 (- - - - - - - - O))
                     (6 (- - - - - - - - O))
                     (8 (- - - - - - - - O))))

                    ((E 5) 
                     ((1 (- - - - - - - - X))
                     (3 (- - - - - - - - X))
                     (5 (- - - - - - - - X))
                     (7 (- - - - - - - - X))))

                    ((F 6) 
                     ((2 (- - - - - - - - O))
                     (4 (- - - - - - - - O))
                     (6 (- - - - - - - - O))
                     (8 (- - - - - - - - O))))

                    ((G 7) 
                     ((1 (- - - - - - - - X))
                     (3 (- - - - - - - - X))
                     (5 (- - - - - - - - X))
                     (7 (- - - - - - - - X))))

                    ((H 8) 
                    ((2 (- - - - - - - - -))
                     (4 (- - - - - - - - -))
                     (6 (- - - - - - - - -))
                     (8 (- - - - - - - - -))))
                    ))

 (setq computerState8'( ((A 1) 
                    ((1 (- - - - - - - - -)) 
                     (3 (- - - - - - - - -))
                     (5 (- - - - - - - - -))
                     (7 (- - - - - - - - -))))
                    ((B 2) 
                    ((2 (- - - - - - - - X))
                     (4 (- - - - - - - - X))
                     (6 (- - - - - - - - X))
                     (8 (- - - - - - - - X))))
                    ((C 3) 
                    ((1 (- - - - - - - - O))
                     (3 (- - - - - - - - O))
                     (5 (- - - - - - - - O))
                     (7 (- - - - - - - - O))))

                    ((D 4) 
                     ((2 (- - - - - - - - X))
                     (4 (- - - - - - - - X))
                     (6 (- - - - - - - - X))
                     (8 (- - - - - - - - X))))

                    ((E 5) 
                     ((1 (- - - - - - - - O))
                     (3 (- - - - - - - - O))
                     (5 (- - - - - - - - O))
                     (7 (- - - - - - - - O))))

                    ((F 6) 
                     ((2 (- - - - - - - - X))
                     (4 (- - - - - - - - X))
                     (6 (- - - - - - - - X))
                     (8 (- - - - - - - - X))))

                    ((G 7) 
                     ((1 (- - - - - - - - O))
                     (3 (- - - - - - - - O))
                     (5 (- - - - - - - - O))
                     (7 (- - - - - - - - O))))

                    ((H 8) 
                    ((2 (- - - - - - - - -))
                     (4 (- - - - - - - - -))
                     (6 (- - - - - - - - -))
                     (8 (- - - - - - - - -))))
                    ))
                    
(setq humanState10'(((A 1) 
                     ((1 (- - - - - - - - -))
                     (3 (- - - - - - - - -)) 
                     (5 (- - - - - - - - -))
                     (7 (- - - - - - - - -))
                     (9 (- - - - - - - - -))))

                    ((B 2) 
                     ((2 (- - - - - - - - O))
                     (4 (- - - - - - - - O))
                     (6 (- - - - - - - - O))
                     (8 (- - - - - - - - O))
                     (10 (- - - - - - - - O))))

                    ((C 3) 
                    ((1 (- - - - - - - - X))
                     (3 (- - - - - - - - X))
                     (5 (- - - - - - - - X))
                     (7 (- - - - - - - - X))
                     (9 (- - - - - - - - X))))

                    ((D 4) 
                     ((2 (- - - - - - - - O))
                     (4 (- - - - - - - - O))
                     (6 (- - - - - - - - O))
                     (8 (- - - - - - - - O))
                     (10 (- - - - - - - - O))))

                    ((E 5) 
                     ((1 (- - - - - - - - X))
                     (3 (- - - - - - - - X))
                     (5 (- - - - - - - - X))
                     (7 (- - - - - - - - X))
                     (9 (- - - - - - - - X))))

                    ((F 6) 
                     ((2 (- - - - - - - - O))
                     (4 (- - - - - - - - O))
                     (6 (- - - - - - - - O))
                     (8 (- - - - - - - - O))
                     (10 (- - - - - - - - O))))

                    ((G 7) 
                     ((1 (- - - - - - - - X))
                     (3 (- - - - - - - - X))
                     (5 (- - - - - - - - X))
                     (7 (- - - - - - - - X))
                     (9 (- - - - - - - - X))))

                    ((H 8) 
                        ((2 (- - - - - - - - O))
                        (4 (- - - - - - - - O))
                        (6 (- - - - - - - - O))
                        (8 (- - - - - - - - O))
                        (10 (- - - - - - - - O))))

                    ((I 9) 
                     ((1 (- - - - - - - - X))
                     (3 (- - - - - - - - X))
                     (5 (- - - - - - - - X))
                     (7 (- - - - - - - - X))
                     (9 (- - - - - - - - X))))

                    ((J 10) 
                     ((2 (- - - - - - - - -)) 
                     (4 (- - - - - - - - -))
                     (6 (- - - - - - - - -))
                     (8 (- - - - - - - - -))
                     (10 (- - - - - - - - -))))
                    ))

 (setq computerState10'(((A 1) 
                     ((1 (- - - - - - - - -))
                     (3 (- - - - - - - - -)) 
                     (5 (- - - - - - - - -))
                     (7 (- - - - - - - - -))
                     (9 (- - - - - - - - -))))

                    ((B 2) 
                     ((2 (- - - - - - - - X))
                     (4 (- - - - - - - - X))
                     (6 (- - - - - - - - X))
                     (8 (- - - - - - - - X))
                     (10 (- - - - - - - - X))))

                    ((C 3) 
                    ((1 (- - - - - - - - O))
                     (3 (- - - - - - - - O))
                     (5 (- - - - - - - - O))
                     (7 (- - - - - - - - O))
                     (9 (- - - - - - - - O))))

                    ((D 4) 
                     ((2 (- - - - - - - - X))
                     (4 (- - - - - - - - X))
                     (6 (- - - - - - - - X))
                     (8 (- - - - - - - - X))
                     (10 (- - - - - - - - X))))

                    ((E 5) 
                     ((1 (- - - - - - - - O))
                     (3 (- - - - - - - - O))
                     (5 (- - - - - - - - O))
                     (7 (- - - - - - - - O))
                     (9 (- - - - - - - - O))))

                    ((F 6) 
                     ((2 (- - - - - - - - X))
                     (4 (- - - - - - - - X))
                     (6 (- - - - - - - - X))
                     (8 (- - - - - - - - X))
                     (10 (- - - - - - - - X))))

                    ((G 7) 
                     ((1 (- - - - - - - - O))
                     (3 (- - - - - - - - O))
                     (5 (- - - - - - - - O))
                     (7 (- - - - - - - - O))
                     (9 (- - - - - - - - O))))

                    ((H 8) 
                        ((2 (- - - - - - - - X))
                        (4 (- - - - - - - - X))
                        (6 (- - - - - - - - X))
                        (8 (- - - - - - - - X))
                        (10 (- - - - - - - - X))))

                    ((I 9) 
                     ((1 (- - - - - - - - O))
                     (3 (- - - - - - - - O))
                     (5 (- - - - - - - - O))
                     (7 (- - - - - - - - O))
                     (9 (- - - - - - - - O))))

                    ((J 10) 
                     ((2 (- - - - - - - - -)) 
                     (4 (- - - - - - - - -))
                     (6 (- - - - - - - - -))
                     (8 (- - - - - - - - -))
                     (10 (- - - - - - - - -))))
                    ))










































(defun byteGame ()
    (cond 
        ((and (eq byte-matSize '8)(eq firstPlayer '0))
             (writeBordNumbers byte-matSize) 
             (format t "~%")
             (setq byte-state humanState8) 
             (printBord letterList counter byte-state))
        ((and (eq byte-matSize '8)(eq firstPlayer '1))
             (writeBordNumbers byte-matSize) 
             (format t "~%")
             (setq byte-state computerState8) 
             (printBord letterList counter byte-state))
        ((and (eq byte-matSize '10)(eq firstPlayer '0))
             (writeBordNumbers byte-matSize) 
             (format t "~%")
             (setq byte-state humanState10)  
             (printBord letterList counter byte-state)) 
        ((and (eq byte-matSize '10)(eq firstPlayer '1))
             (writeBordNumbers byte-matSize) 
             (format t "~%") 
             (setq byte-state computerState10) 
             (printBord letterList counter byte-state))
        (:else (print "Unesite velicinu polja") (setq byte-matSize (read)) 
               (print "Da li zelite da igrate prvi? 1 za da 0 za ne") (setq firstPlayer (read)) 
               (byteGame))
    )
)

(defun writeInitialState (brdSize player letterList state &optional (n '5) (m '9) (l '8)) ;;Ako je board size 10 onda je n 5, a ako je 8 onda je 4
    (if (eq player '0)
        (cond 
           ((eq brdSize '0) ())
            ((not (eq n '0)) 
                (cond
                ((eq brdSize '1)
                    (writeInitialState brdSize player letterList (cons (list m '(- - - - - - - - -)) state) (- n 1) (- m 2)))
                ((eq brdSize '10)
                    (writeInitialState brdSize player letterList (cons (list l '(- - - - - - - - -)) state) (- n 1) m (- l 2)))     
                ((eq (mod brdSize 2) '0)  
                    (writeInitialState brdSize player letterList (cons (list l '(- - - - - - - - X)) state) (- n 1) m (- l 2)))
                            
                (t (cons '(- - - - - - - - O) byte-state) 
                    (writeInitialState brdSize player letterList (cons (list m '(- - - - - - - - O)) state) (- n 1) (- m 2)))           
            ))
            ((writeInitialState (- brdSize 1) player (cdr letterList)   (cons (car letterList) state)) (+ n 5) (= m 9) (= l 8))
        )
    )
)



;; (
;; (B 2) (1 (- - - - - - - - -)) (2 (- - - - - - - - -)) (3 (- - - - - - - - -)) (4 (- - - - - - - - -)) (5 (- - - - - - - - -)) 
;; (A 1) (1 (- - - - - - - - X)) (2 (- - - - - - - - X)) (3 (- - - - - - - - X)) (4 (- - - - - - - - X)) (5 (- - - - - - - - X))
;; )

(defun writeBordNumbers (matSize)
    (cond 
        ((> matSize 0) (writeBordNumbers (- matSize 1)) (format t "      ~a  " matSize))
    )
)

(defun printBord (letterList counter initialState)
    (cond 
        ((eq counter '0) '())
        ((eq (mod counter 3) 2)
            (format t "~%~a " (car (assoc (caar letterList) letterList)))
            (drawRow 
                (* 3 byte-matSize) 
                (cadr (assoc (caar letterList) letterList)) 
                testCounter (cadar initialState) '3 '2) 
            (printBord 
                letterList (- counter 1) initialState))
        ((eq (mod counter 3) 1)
            (format t "~%  " (car (assoc (caar letterList) letterList)))
            (drawRow 
                (* 3 byte-matSize) 
                (cadr (assoc (caar letterList) letterList))
                testCounter (cadar initialState) '6 '3) 
            (printBord (cdr letterList) (- counter 1) (cdr initialState)))
        (t (format t "~%  ")     
            (drawRow 
                (* 3 byte-matSize) 
                (cadr (assoc (caar letterList) letterList)) 
                testCounter (cadar initialState) '0 '1) 
            (printBord letterList (- counter 1) initialState))
    )
    
)
;;Postoji resenje koje kaze mesto intState koristi globalni byte-state uz malo promena
;;ali ga vrati na staro kad zavrsis
;; (defun drawRow (cnt letterNo btSize intState &optional (n 3))
;;     (cond 
;;         ((eq n '0)(setq btSize (+ btSize 1))(setq n 3))
;;     )
;;     (cond 
;;         ((null intState) ())
;;         ((eq (+ 1 (caar intState)) btSize) (setq intState (cdr intState)))
;;     )
;;     (cond 
;;         ((eq cnt '0) '())
;;         ;; ((eq (mod (+ letterNo btSize) '2) '0) 
;;         ;;     (format t "   ") 
;;         ;;     (drawRow (- cnt 1) letterNo btSize intState (- n 1))) 
;;         ((eq btSize (car (assoc btSize intState)))  (format t " ~a " (caar (cdr (assoc btSize intState)))) 
;;             (drawRow (- cnt 1) letterNo btSize (append (list (list btSize (cdar (cdr (assoc btSize intState))))) (cdr intState)) (- n 1)))
;;             (t  (format t "   ") 
;;                 (drawRow (- cnt 1) letterNo btSize intState (- n 1))) 
;;     )
;; )
(defun drawRow (cnt letterNo btSize intState &optional n m)
    (cond 
        ((and (eq n '3)(eq m '1))(setq btSize (+ btSize 1))(setq n 0))
    )
    (cond 
        ((and (eq n '6)(eq m '2))(setq btSize (+ btSize 1))(setq n 3))
    )
    (cond 
        ((and (eq n '9)(eq m '3))(setq btSize (+ btSize 1))(setq n 6 ))
    )
    (cond 
        ((null intState) ())
        ((eq (+ 1 (caar intState)) btSize) (setq intState (cdr intState)))
    )
    (cond 
        ((eq cnt '0) '())
        ;; ((eq (mod (+ letterNo btSize) '2) '0) 
        ;;     (format t "   ") 
        ;;     (drawRow (- cnt 1) letterNo btSize intState (- n 1))) 
        ((eq btSize (car (assoc btSize intState)))  (format t " ~a " (nth n (car (cdr (assoc btSize intState))))) ;ove neki nth 
            (cond
                ((and (eq n '3) (eq m '1)) (drawRow (- cnt 1) letterNo btSize intState (cdr intState)) (+ n 1) m)           
                ((and (eq n '6) (eq m '2)) (drawRow (- cnt 1) letterNo btSize intState (cdr intState)) (+ n 1) m)           
                ((and (eq n '9) (eq m '3)) (drawRow (- cnt 1) letterNo btSize intState (cdr intState)) (+ n 1) m)           
                (t (drawRow (- cnt 1) letterNo btSize intState (+ n 1) m))           
            )      
            ;; (drawRow (- cnt 1) letterNo btSize intState (cdr intState)) (+ n 1) m))
           
        )
         (t  (format t "   ") 
            (drawRow (- cnt 1) letterNo btSize intState (+ n 1) m)) 
    )
)


;; (defun newList (initialState)
;;     (cond
;;         ((null initialState) '())
;;         (t ()) 
;;     )
;; )
;;  (trace drawRow)
;; (byteGame)
(trace writeInitialState)
  (print (writeInitialState '10 '0 letterList byte-state))

;; (print byte-state)

;; (print (caar (cdr (assoc '1 byte-state))))
;;  (print  (append (list (list '1 (cdar (cdr (assoc '1 (cadar byte-state)))))) (cdadar byte-state)))
;;   (print  (list '1 (cdar (cdr (assoc '1 (cadar byte-state))))))
;;  (print (car (caadar byte-state)))

