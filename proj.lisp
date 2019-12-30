(defstruct byte
    state ; (- X X X O O O O)
    matSize
)

(setq letterList '((A 1) (B 2) (C 3) (D 4) (E 5) (F 6) (G 7) (H 8) (I 9) (J 10)))
(setq resultH '())
(setq resultAI '())
(print "Unesite velicinu polja")
(setq byte-matSize (read))

(setq  counter (* byte-matSize 3))

(print "Da li zelite da igrate prvi? 1 za da 0 za ne")
(setq firstPlayer (read))

(setq byte-state '())
(setq tmpBrdSize byte-matSize)

(defun byteGame ()
(cond
    ((and (eq resultH '2)(eq byte-matSize '8)) (print "Vi ste pobednik"))
    ((and (eq resultAI '3)(eq byte-matSize '10)) (print "Kompijuter je pobednik"))
)
(cond 
((and (or (eq byte-matSize '8) (eq byte-matSize '10)) (or (eq firstPlayer '0) (eq firstPlayer '1)))
 (writeBordNumbers byte-matSize)
 (format t "~%")
 (writeInitialState byte-matSize firstPlayer letterList byte-state)
 (printBord letterList counter byte-state)
)

(t (print "Unesite velicinu polja") (setq byte-matSize (read)) (setq tmpBrdSize byte-matSize) (setq counter (* byte-matSize 3))
  (print "Da li zelite da igrate prvi? 1 za da 0 za ne") (setq firstPlayer (read)) 
  (byteGame)
)))

(defun writeInitialState (brdSize player letterList state &optional (n (/ tmpBrdSize 2)) (m (- tmpBrdSize 1)) (l tmpBrdSize) (help '()) (tmplist '())) ;;(bordSize = 10 => l = 10 ^ m = 9; bordSize = 8 => l = 8 ^ m = 7)
    (if (eq player '0)                                                                                                                                 ;;l i m sluze za indeksiranje polja; l za parna, a m za neparna
        (cond 
           ((eq brdSize '0)  (setq byte-state (reverse state)))
            ((not (eq n '0)) 
                (cond
                ((eq brdSize '1)
                    (writeInitialState brdSize player letterList state (- n 1) m (- l 2) (cons (list l '(- - - - - - - - -)) help))) ;;Zavrsava se parno uvek
                ((eq brdSize tmpBrdSize)
                    (writeInitialState brdSize player letterList state (- n 1) (- m 2) l (cons (list m '(- - - - - - - - -)) help))) ;;Pocinje neparno uvek    
                ((eq (mod brdSize 2) '0)  
                    (writeInitialState brdSize player letterList state (- n 1) (- m 2) l (cons (list m '(- - - - - - - - X)) help)))
                (t (writeInitialState brdSize player letterList state (- n 1) m (- l 2) (cons (list l '(- - - - - - - - O)) help)))           
            ))
            ((setq tmplist (cons (car letterList) (cons help tmplist)))
            (writeInitialState (- brdSize 1) player (cdr letterList) (cons tmplist state)))
        )
        (cond 
           ((eq brdSize '0) (setq byte-state (reverse state)))
            ((not (eq n '0)) 
                (cond
                ((eq brdSize '1)
                    (writeInitialState brdSize player letterList state (- n 1) m (- l 2) (cons (list l '(- - - - - - - - -)) help)))
                ((eq brdSize tmpBrdSize)
                    (writeInitialState brdSize player letterList state (- n 1) (- m 2) l (cons (list m '(- - - - - - - - -)) help)))     
                ((eq (mod brdSize 2) '0)  
                    (writeInitialState brdSize player letterList state (- n 1) (- m 2) l (cons (list m '(- - - - - - - - O)) help)))

                (t (writeInitialState brdSize player letterList state (- n 1) m (- l 2) (cons (list l '(- - - - - - - - X)) help)))           
            ))
            ((setq tmplist (cons (car letterList) (cons help tmplist)))
            (writeInitialState (- brdSize 1) player (cdr letterList) (cons tmplist state)))
        )
    )
)


(defun proclaimWinner (status)
    (cond 
        ((null status) '())
        ((eq (cadar (mapcar 'cadr (cadar status))) 'X) (setq resultH (+ 1 result)) 
                                                       (proclaimWinner (cdr status)))
        ((eq (cadar (mapcar 'cadr (cadar status))) 'O) (setq resultAI (+ 1 result))
                                                       (proclaimWinner (cdr status)))
    )
)

(defun writeBordNumbers (matSize)
    (cond 
        ((eq matSize '0) '())
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
                1 (cadar initialState) '3 '2) 
            (printBord 
                letterList (- counter 1) initialState))
        ((eq (mod counter 3) 1)
            (format t "~%  " (car (assoc (caar letterList) letterList)))
            (drawRow 
                (* 3 byte-matSize) 
                (cadr (assoc (caar letterList) letterList))
                1 (cadar initialState) '6 '3) 
            (printBord (cdr letterList) (- counter 1) (cdr initialState)))
        (t (format t "~%  ")     
            (drawRow 
                (* 3 byte-matSize) 
                (cadr (assoc (caar letterList) letterList)) 
                1 (cadar initialState) '0 '1) 
            (printBord letterList (- counter 1) initialState))
    )
    
)

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
        ((eq btSize (car (assoc btSize intState)))  (format t " ~a " (nth n (car (cdr (assoc btSize intState))))) 
            (cond
                ((and (eq n '3) (eq m '1)) (drawRow (- cnt 1) letterNo btSize intState (cdr intState)) (+ n 1) m)           
                ((and (eq n '6) (eq m '2)) (drawRow (- cnt 1) letterNo btSize intState (cdr intState)) (+ n 1) m)           
                ((and (eq n '9) (eq m '3)) (drawRow (- cnt 1) letterNo btSize intState (cdr intState)) (+ n 1) m)           
                (t (drawRow (- cnt 1) letterNo btSize intState (+ n 1) m))           
            )                
        )
         (t  (format t "   ") 
            (drawRow (- cnt 1) letterNo btSize intState (+ n 1) m)) 
    )
) 

(byteGame)
;; (print (cadar (mapcar 'cadr (cadar (writeInitialState '10 '0 letterList byte-state)))))
