(defstruct byte
    state ; (- X X X O O O O)
    matSize
)
(setq checkedList '()) ;;Neproverena lista
(setq checkedLetters '()) ;;Neproverena lista
(setq graph '()) ;;Smestamo ovde graf
(setq row '())
(setq letterList '((A 1) (B 2) (C 3) (D 4) (E 5) (F 6) (G 7) (H 8) (I 9) (J 10)))
(setq resultH 0)
(setq resultAI 0)
(setq currentPlayer 'O) ;;Menjamo X pa O pa X kako se odigra potez. Na pocetku igrac X igra
(setq helpStack '())
(setq prepareNode1 '())
(setq prepareNode2 '())
(print "Unesite velicinu polja")
(setq byte-matSize (read))

(setq  counter (* byte-matSize 3))

(print "Da li zelite da igrate prvi? 1 za da 0 za ne")
(setq firstPlayer (read))

(setq byte-state '())
(setq tmpBrdSize byte-matSize)

(defun byteGame ()
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
        (t (helpProclaimWinner (mapcar 'cadr (cadar status))) (proclaimWinner (cdr status)))
    )
)

(defun helpProclaimWinner (status)
    (cond 
        ((null status) '())
        ((eq (nth 1 (car status)) 'X) (setq resultH (+ 1 resultH)) 
                                                       (helpProclaimWinner (cdr status)))
        ((eq (nth 1 (car status)) 'O) (setq resultAI (+ 1 resultAI))
                                                       (helpProclaimWinner (cdr status)))
        (t (helpProclaimWinner (cdr status)))
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

(defun makeGraph (uncheckedList checkedList letterList) ;;uncheckedList je byte-state
(cond 
((null uncheckedList)   '())
(t (setq row (car uncheckedList))
   (addToGraph (cdr row) (cdr uncheckedList) checkedList letterList checkedLetters 0)
   (setq checkedList row)
   (setq checkedLetters (car letterList))
   (makeGraph (cdr uncheckedList) checkedList (cdr letterList)))
)
)

(defun addToGraph (row uncheckedList checkedList letter checkedLetters n &optional (help '()))
(cond 
((eq n (/ tmpBrdSize 2)) '())
((null checkedList)
    (cond 
    ((eq (- n 1) -1)
     (setq graph 
     (append
     (list (append help (append help (list (cons (car letter) (list (nth n (car row))))))
     (append help (list (append (list (cons (car (cdr letter)) (list (nth n (car (cdr (car uncheckedList)))))))))))
     )
     graph
     )
     )    
     (addToGraph row uncheckedList checkedList letter checkedLetters (+ n 1)))
        (t 
        (setq graph 
     (append
     (list (append help (append help (list (cons (car letter) (list (nth n (car row))))))
     (append help (list (append (list (append (list (cons (car (cdr letter)) (list (nth n (car (cdr (car uncheckedList))))))))) (list (append (list (cons (car (cdr letter)) (list (nth (- n 1) (car (cdr (car uncheckedList)))))))))))))
     )
     graph
     )
     )    
     (addToGraph row uncheckedList checkedList letter checkedLetters (+ n 1))



    )
 
 
 )) ;;prvi element
((null  uncheckedList)
     (cond ((eq (+ n 1) (/ tmpBrdSize 2))
     (setq graph 
     (append
     (list (append help (append help (list (cons (car letter) (list (nth n (car row))))))
     (append help (list (append (list (cons checkedLetters (list (nth n  (car (cdr checkedList))))))))))
     )
     graph
     )
     )    
     (addToGraph row uncheckedList checkedList letter checkedLetters (+ n 1)))
     (t (setq graph 
     (append
     (list (append help (append help (list (cons (car letter) (list (nth n (car row))))))
     (append help (list (append (list (append (list (cons checkedLetters (list (nth n  (car (cdr checkedList)))))))) (list (append (list (cons checkedLetters (list (nth (+ n 1)  (car (cdr checkedList))))))))))))
     )
     graph
     )
     )    
     (addToGraph row uncheckedList checkedList letter checkedLetters (+ n 1)))

     )
) ;;poslednji element
((eq (mod (car (cdr (car letter))) 2) 0)
(cond 
((eq (+ n 1) (/ tmpBrdSize 2))
(setq graph 
     (append
     (list (append help (append help (list (cons (car letter) (list (nth n (car row))))))
     (append help (list (append (list (append (list (cons checkedLetters (list (nth n  (car (cdr checkedList)))))))) (list (append (list (cons (car (cdr letter)) (list (nth n (car (cdr (car uncheckedList)))))))))))))
     )
     graph
     )
     )    
     (addToGraph row uncheckedList checkedList letter checkedLetters (+ n 1))


)
(t
     (setq graph
     (append 
     (list (append help (append help (list (cons (car letter) (list (nth n (car row)))))) 
     
     (list ;;na help listu pravimo listu
                    (append ;;na koju appendujemo
                        (append ;;vec appendovana
                            (list (append (list (cons (car (cdr letter)) (list (nth n (car (cdr (car uncheckedList))))))))) ;;listu jednog potomka
                            (list (append (list (cons (car (cdr letter)) (list (nth (+ n 1) (car (cdr (car uncheckedList))))))))) ;;i listu drugog potomka
                        )
                        (append 
                            (list (append (list (cons checkedLetters (list (nth n  (car (cdr checkedList)))))))) ;;listu treceg potomka
                            (list (append (list (cons checkedLetters (list (nth (+ n 1)  (car (cdr checkedList)))))))) ;;listu cetvrtog
                        )                 
                    )
                   )
     ))
     graph))
     (addToGraph row uncheckedList checkedList letter checkedLetters (+ n 1)))
)
) ;;radi za parne
(t
(cond 
((eq (- n 1) -1)
(setq graph 
     (append
     (list (append help (append help (list (cons (car letter) (list (nth n (car row))))))
     (append help (list (append (list (append (list (cons checkedLetters (list (nth n  (car (cdr checkedList)))))))) 
(list (append (list (cons (car (cdr letter)) (list (nth n (car (cdr (car uncheckedList)))))))))))))
     )
     graph
     )
     )    
     (addToGraph row uncheckedList checkedList letter checkedLetters (+ n 1))


)
(t (append help (list (cons (car letter) (list (nth n (car row))))))
     (setq graph
     (append 
     (list (append help (append help (list (cons (car letter) (list (nth n (car row)))))) 
     
     (list ;;na help listu pravimo listu
                    (append ;;na koju appendujemo
                        (append ;;vec appendovana
                            
(list (append (list (cons (car (cdr letter)) (list (nth n (car (cdr (car uncheckedList))))))))) ;;listu jednog potomka
                            
(list (append (list (cons (car (cdr letter)) (list (nth (- n 1) (car (cdr (car uncheckedList))))))))) ;;i listu drugog potomka
                        )
                        (append 
                            (list (append (list (cons checkedLetters (list (nth n  (car (cdr checkedList)))))))) ;;listu treceg potomka
                            (list (append (list (cons checkedLetters (list (nth (- n 1)  (car (cdr checkedList)))))))) ;;listu cetvrtog
                        )                 
                    )
                   )
     ))
     graph))
     (addToGraph row uncheckedList checkedList letter checkedLetters (+ n 1))
)
)
)
) ;;radi za neparne u defaultu da doda u checkedList
)
    (defun reverseGraph ()
     (setq graph (reverse graph)) ;;Ovo koristimo uvek kad napravimo graf
    )




(defun checkNode (graf node1 node2 level)
(cond
(
(null graf) ;;Uslov za izlaz
(print "Niste uneli postojeci cvor, molim Vas unesite ponovo potez") ;;Ako ne postoji cvor
(checkNode (setq graf graph) (setq node1 (read)) (setq node2 (read)) (setq level (read))) ;;Opet zove funkciju da se zadaju parametri
)


((and (eq (car node1) (car (car (car (car graf))))) (eq (car (cdr node1)) (car (car (cdr (car (car graf))))))) ;;Ako pronadjemo cvor
(print "Nasli smo cvor") ;;Kad pronadjemo prvi cvor da postoji

(cond 
(
(null (member currentPlayer (car (cdr (car (cdr (car (car graf)))))))) ;;Ovde se proverava da li nas cvor iz koga krecemo ima figuru (Ovo je za NE)
(print "Izabrano polje nema vasu figuru za pomeriti, pokusajte drugim poljem.")
(checkNode (setq graf graph) (setq node1 (read)) (setq node2 (read)) (setq level (read)))
)
(t (checkNeighbour (car (cdr (car graf))) node1 node2 level)) ;;Proveravamo da li uopste je drugo polje komsija prvog polja
)
)

(t (checkNode (cdr graf) node1 node2 level))
)
)

(defun checkNeighbour (graf node1 node2 level) ;;Proverava da li je drugo uneto polje sused prvog unetog polja
(cond
((null graf)
(print "Cvorovi nisu susedi. Pokusajte ponovo.")
(checkNode graph (setq node1 (read)) (setq node2 (read)) (setq level (read)))
)
((and (eq (car node2) (caaaar graf)) (eq (car (cdr node2)) (car (cadaar graf)))) ;;Postoji node2 kao potomak
(cond
((eq (nth 8 (car (cdr (car (cdr (car (car graf))))))) '-) ;;Da li je stack prazan
(prepareNode graph node1 node2)
)
(t (beginMerge graph node1 node2 level))
)
)
(t (checkNeighbour (cdr graf) node1 node2 level))

)

)

(defun beginMerge (graf node1 node2 level)
 (setq prepareNode1 (getNode graph node1))
 (setq prepareNode2 (getNode graph node2))
 (checkLevel prepareNode1 prepareNode2 level)
)

(defun checkLevel (node1 node2 level)
;;9-level da bih poklopio
(cond 
((eq currentPlayer (nth (- 9 level) (cadadr node1)))
(checkLevelHigher node1 node2 level)
)
(t (print "Nivo koji ste izabrali ne sadrzi vasu figuru. Odigrajte ponovo potez.") 
   (checkNode graph (setq node1 (read)) (setq node2 (read)) (setq level (read))))
))

(defun checkLevelHigher (node1 node2 level &optional n)
(setq level2 (setLevel2 (reverse (cadadr node2))))
(cond 
((>= (+ level2 1) level) (breakStacks node1 node2 level level2))
(t (print "Ne mozete premestiti figuru jer ne dozvoljava nivo. Odigrajte potez ponovo") (checkNode graph (setq node1 (read)) (setq node2 (read)) (setq level (read))))
)
)

(defun breakStacks (node1 node2 level level2)
 (setq start (getToStart (reverse (cadadr node1))(- level 1) )) ;; '(X O O X O - - - -) 2
 (cond
     ((> (+ (length start) level2) 8) (print "Ne moze se prelomiti stack posto ce se prepuniti naredni stack") 
     (checkNode graph (setq node1 (read)) (setq node2 (read)) (setq level (read)))
     )
     (t (breakingBad node1 node2 level level2 start))
 )
)

(defun breakingBad (node1 node2 level level2 start)
(print "I have fallen")
)

(defun getToStart (node1 level &optional (new '()) (counting 0))
(cond
((> level 0) (getToStart (cdr node1) (- level 1) new counting))
((equal (car node1) '-) new)
(t (setq new (append new (list (car node1)))) (getToStart (cdr node1) level new (+ counting 1)))
)
)

(defun setLevel2 (node2 &optional (n 0))
(cond
((not (eq (car node2) '-)) (setLevel2 (cdr node2) (+ n 1)) )
(t n)
))

(defun getNode (graf node)
(cond
((null graf) (print "Nema nista"))
((and (eq (car node) (car (car (car (car graf))))) (eq (car (cdr node)) (car (car (cdr (car (car graf)))))))  (caar graf))
(t (getNode (cdr graf) node))
)
)

(defun prepareNode (graf node1 node2)
(cond
((and (eq (car node1) (car (car (car (car graf))))) (eq (car (cdr node1)) (car (car (cdr (car (car graf))))))) ;;Ovde nalazimo i saljemo decu cvora da nadjemo najkraci put
(findShortestPath graph (car (cdr (car graf))) node2)
)
(t (prepareNode (cdr graf) node1 node2))
)
)

(defun canIMoveIt (stack node2)
(cond
((null stack) (print "Nikom nista"))
((equal (caar stack) node2) (canIMoveIt2 helpStack (car stack))
)
(t (canIMoveIt (cdr stack) node2))
))

(defun canIMoveIt2 (stack node2 &optional (node3 '()))
(cond
((and (null stack) (not (eq node3 nil))) (print "Morate ponovo odigrati potez") (checkNode graph (setq node1 (read)) (setq node2 (read))) (setq level (read)))
((null stack) (print "IDEMOO")) ;;pomeraj ovde radimo
((<= (cadr node2) (cadr (car stack)))  (canIMoveIt2 (cdr stack) node2 node3))
(t (setq node3 (car stack)) (canIMoveIt2 (cdr stack) node2 node3))
)
)

(defun findShortestPath (graf children node2) ;;graf ceo, deca koja treba da se obidju i cvor na koji zelimo da se pomerimo
(cond
((null children) (canIMoveIt helpStack node2))
(t (findPath graph (caar children) node2)
   (findShortestPath graph (cdr children) node2)
)
)
)

(defun findPath (graf child node2) ;;Uvek mi treba ceo graf kad zovem  
(depth-first3 graph (list (list child '0)) '() child)
(print helpStack)
)

(defun depth-first3(graph traversed visited child)
  (cond
;;   ((not (eq (nth 8 (cadadr child)) '-)) (print "Morate odigrati na stack koji sadrzi figure") (checkNode graph (setq node1 (read)) (setq node2 (read))))
   ((null traversed) NIL) ;;Ako dodjemo da nema vise cvorova za obilazenje onda vraca nil (gleda cvor)
   (:else (let*
              ((new-visited (append visited (list (car traversed)))) ;;U promenljivu new-visited appenduje sve posecene (za sada je to '() i listu)
               (children (add-children3 graph (car traversed)        ;;prvog koji treba da se obilazi (A 0) npr...
                                        (append (cdr traversed) new-visited) child)) ;;U promenljivu children se smesta rezultat fje add-children3
               (new-traversed (append (cdr traversed) children))               ;;gde saljemo graf, prvi koji treba da se obidje (A 0) i sve posecene cvorove (dodajemo na ostatak traversed new-visited)
               ;;(traversal (depth-first3 graph new-traversed new-visited))) ;;u new-traversed se smesta ostatak koji treba da se obidju i deca
            ;;(cons (car traversed) traversal))) ;;I onda vezujemo za (A 0) traversal (on je opet depth-first3 samo sa novim koji treba da se obidju i to)
   )))))

;;; Returns unvisited nodes from the children of a node
(defun add-children3(graf node visited child)
  (cond
   ((null graf) NIL)
   ((equal (caar graf) (car node)) (new-nodes3 (cadar graf) visited
                                                (1+ (cadr node)) child))
                                                
   (:else (add-children3 (cdr graf) node visited child))
   ))
  

  (defun new-nodes3(children visited depth child)
  (cond
   ((null children) NIL)
   ((not (eq (nth 8 (cadr (cadaar children))) '-)) 
   (cond 
   ((not (eq (nth 8 (cadadr child)) '-)) (setq helpStack (append helpStack (list (list (list (caar child) (caadr child)) (- depth 1)))))
   )
   (t (setq helpStack (append helpStack (list (list (list (caar child) (caadr child)) depth)))))
   ))
   ((assocmember3 (car children) visited) (new-nodes3 (cdr children) visited depth))
   (:else (cons (list (caar children) depth) 
                (new-nodes3 (cdr children) visited depth child)))
   )
  )
  

  (defun assocmember3(key als)
  (cond
   ((null als) NIL)
   ((equal key (caar als)) T)
   (:else (assocmember3 key (cdr als)))
   )
  )

  (defun checkWinner ()
  (cond
    ((and (eq resultH '3)(eq byte-matSize '8)) (print "Vi ste pobednik"))
    ((and (eq resultH '5)(eq byte-matSize '10)) (print "Vi ste pobednik"))
    ((and (eq resultAI '5)(eq byte-matSize '10)) (print "Kompijuter je pobednik"))
    ((and (eq resultAI '3)(eq byte-matSize '8)) (print "Kompijuter je pobednik"))
) 
  )

(byteGame)
 (makeGraph byte-state checkedList letterList)
 (reverseGraph)
 (format t "~%  ")
 (checkNode graph (setq node1 (read)) (setq node2 (read)) (setq level (read)))
 
;; (print (writeInitialState '8 '0 letterList byte-state))
;;  (proclaimWinner '(((A 1) ((1 (- - - - - - - - -)) (3 (- - - - - - - - -)) (5 (- - - - - - - - -)) (7 (- - - - - - - - -))))
;;  ((B 2) ((2 (- - - - - - - - O)) (4 (- - - - - - - - O)) (6 (- - - - - - - - O)) (8 (- - - - - - - - O))))
;;  ((C 3) ((1 (- X - - - - - - X)) (3 (- - - - - - - - X)) (5 (- X - - - - - - X)) (7 (- - - - - - - - X))))
;;  ((D 4) ((2 (- X - - - - - - O)) (4 (- - - - - - - - O)) (6 (- - - - - - - - O)) (8 (- - - - - - - - O))))
;;  ((E 5) ((1 (- - - - - - - - X)) (3 (- - - - - - - - X)) (5 (- - - - - - - - X)) (7 (- - - - - - - - X))))
;;  ((F 6) ((2 (- - - - - - - - O)) (4 (- - - - - - - - O)) (6 (- - - - - - - - O)) (8 (- - - - - - - - O))))
;;  ((G 7) ((1 (- - - - - - - - X)) (3 (- - - - - - - - X)) (5 (- - - - - - - - X)) (7 (- - - - - - - - X))))
;;  ((H 8) ((2 (- - - - - - - - -)) (4 (- - - - - - - - -)) (6 (- - - - - - - - -)) (8 (- - - - - - - - -))))))
;;  (print resultH)
;;  (print resultAI)
;;  (checkWinner)
;;  (print prepareNode1)
;;  (print prepareNode2)