;;Ovo je sve za (reverse graph u projektu)
(setq graph '(
 (((A 1) (1 (- - - - - - - - -))) (((B 2) (2 (- - - - - - - - O)))))
 (((A 1) (3 (- - - - - - - - -))) ((((B 2) (4 (- - - - - - - - O)))) (((B 2) (2 (- - - - - - - - O))))))
 (((A 1) (5 (- - - - - - - - -))) ((((B 2) (6 (- - - - - - - - O)))) (((B 2) (4 (- - - - - - - - O))))))
 (((A 1) (7 (- - - - - - - - -))) ((((B 2) (8 (- - - - - - - - O)))) (((B 2) (6 (- - - - - - - - O))))))
 (((B 2) (2 (- - - - - - - - O)))
  ((((C 3) (1 (- - - - - - - - X)))) (((C 3) (3 (- - - - - - - - X)))) (((A 1) (1 (- - - - - - - - -)))) (((A 1) (3 (- - - - - - - - -))))))
 (((B 2) (4 (- - - - - - - - O)))
  ((((C 3) (3 (- - - - - - - - X)))) (((C 3) (5 (- - - - - - - - X)))) (((A 1) (3 (- - - - - - - - -)))) (((A 1) (5 (- - - - - - - - -))))))
 (((B 2) (6 (- - - - - - - - O)))
  ((((C 3) (5 (- - - - - - - - X)))) (((C 3) (7 (- - - - - - - - X)))) (((A 1) (5 (- - - - - - - - -)))) (((A 1) (7 (- - - - - - - - -))))))
 (((B 2) (8 (- - - - - - - - O))) ((((A 1) (7 (- - - - - - - - -)))) (((C 3) (7 (- - - - - - - - X))))))
 (((C 3) (1 (- - - - - - - - X))) ((((B 2) (2 (- - - - - - - - O)))) (((D 4) (2 (- - - - - - - - O))))))
 (((C 3) (3 (- - - - - - - - X)))
  ((((D 4) (4 (- - - - - - - - O)))) (((D 4) (2 (- - - - - - - - O)))) (((B 2) (4 (- - - - - - - - O)))) (((B 2) (2 (- - - - - - - - O))))))
 (((C 3) (5 (- - - - - - - - X)))
  ((((D 4) (6 (- - - - - - - - O)))) (((D 4) (4 (- - - - - - - - O)))) (((B 2) (6 (- - - - - - - - O)))) (((B 2) (4 (- - - - - - - - O))))))
 (((C 3) (7 (- - - - - - - - X)))
  ((((D 4) (8 (- - - - - - - - O)))) (((D 4) (6 (- - - - - - - - O)))) (((B 2) (8 (- - - - - - - - O)))) (((B 2) (6 (- - - - - - - - O))))))
 (((D 4) (2 (- - - - - - - - O)))
  ((((E 5) (1 (- - - - - - - - X)))) (((E 5) (3 (- - - - - - - - X)))) (((C 3) (1 (- - - - - - - - X)))) (((C 3) (3 (- - - - - - - - X))))))
 (((D 4) (4 (- - - - - - - - O)))
  ((((E 5) (3 (- - - - - - - - X)))) (((E 5) (5 (- - - - - - - - X)))) (((C 3) (3 (- - - - - - - - X)))) (((C 3) (5 (- - - - - - - - X))))))
 (((D 4) (6 (- - - - - - - - O)))
  ((((E 5) (5 (- - - - - - - - X)))) (((E 5) (7 (- - - - - - - - X)))) (((C 3) (5 (- - - - - - - - X)))) (((C 3) (7 (- - - - - - - - X))))))
 (((D 4) (8 (- - - - - - - - O))) ((((C 3) (7 (- - - - - - - - X)))) (((E 5) (7 (- - - - - - - - X))))))
 (((E 5) (1 (- - - - - - - - X))) ((((D 4) (2 (- - - - - - - - O)))) (((F 6) (2 (- - - - - - - - O))))))
 (((E 5) (3 (- - - - - - - - X)))
  ((((F 6) (4 (- - - - - - - - O)))) (((F 6) (2 (- - - - - - - - O)))) (((D 4) (4 (- - - - - - - - O)))) (((D 4) (2 (- - - - - - - - O))))))
 (((E 5) (5 (- - - - - - - - X)))
  ((((F 6) (6 (- - - - - - - - O)))) (((F 6) (4 (- - - - - - - - O)))) (((D 4) (6 (- - - - - - - - O)))) (((D 4) (4 (- - - - - - - - O))))))
 (((E 5) (7 (- - - - - - - - X)))
  ((((F 6) (8 (- - - - - - - - O)))) (((F 6) (6 (- - - - - - - - O)))) (((D 4) (8 (- - - - - - - - O)))) (((D 4) (6 (- - - - - - - - O))))))
 (((F 6) (2 (- - - - - - - - O)))
  ((((G 7) (1 (- - - - - - - - X)))) (((G 7) (3 (- - - - - - - - X)))) (((E 5) (1 (- - - - - - - - X)))) (((E 5) (3 (- - - - - - - - X))))))
 (((F 6) (4 (- - - - - - - - O)))
  ((((G 7) (3 (- - - - - - - - X)))) (((G 7) (5 (- - - - - - - - X)))) (((E 5) (3 (- - - - - - - - X)))) (((E 5) (5 (- - - - - - - - X))))))
 (((F 6) (6 (- - - - - - - - O)))
  ((((G 7) (5 (- - - - - - - - X)))) (((G 7) (7 (- - - - - - - - X)))) (((E 5) (5 (- - - - - - - - X)))) (((E 5) (7 (- - - - - - - - X))))))
 (((F 6) (8 (- - - - - - - - O))) ((((E 5) (7 (- - - - - - - - X)))) (((G 7) (7 (- - - - - - - - X))))))
 (((G 7) (1 (- - - - - - - - X))) ((((F 6) (2 (- - - - - - - - O)))) (((H 8) (2 (- - - - - - - - -))))))
 (((G 7) (3 (- - - - - - - - X)))
  ((((H 8) (4 (- - - - - - - - -)))) (((H 8) (2 (- - - - - - - - -)))) (((F 6) (4 (- - - - - - - - O)))) (((F 6) (2 (- - - - - - - - O))))))
 (((G 7) (5 (- - - - - - - - X)))
  ((((H 8) (6 (- - - - - - - - -)))) (((H 8) (4 (- - - - - - - - -)))) (((F 6) (6 (- - - - - - - - O)))) (((F 6) (4 (- - - - - - - - O))))))
 (((G 7) (7 (- - - - - - - - X)))
  ((((H 8) (8 (- - - - - - - - -)))) (((H 8) (6 (- - - - - - - - -)))) (((F 6) (8 (- - - - - - - - O)))) (((F 6) (6 (- - - - - - - - O))))))
 (((H 8) (2 (- - - - - - - - -))) ((((G 7) (1 (- - - - - - - - X)))) (((G 7) (3 (- - - - - - - - X))))))
 (((H 8) (4 (- - - - - - - - -))) ((((G 7) (3 (- - - - - - - - X)))) (((G 7) (5 (- - - - - - - - X))))))
 (((H 8) (6 (- - - - - - - - -))) ((((G 7) (5 (- - - - - - - - X)))) (((G 7) (7 (- - - - - - - - X))))))
 (((H 8) (8 (- - - - - - - - -))) (((G 7) (7 (- - - - - - - - X)))))))

;;(print (car (cdr graph)))
;; (setq currentPlayer 'O) ;;Menjamo X pa O pa X kako se odigra potez. Na pocetku igrac X igra
;; (setq helpStack '())

;; (defun checkNode (graf node1 node2)
;; (cond
;; (
;; (null graf) ;;Uslov za izlaz
;; (print "Niste uneli postojeci cvor, molim Vas unesite ponovo potez") ;;Ako ne postoji cvor
;; (checkNode (setq graf graph) (setq node1 (read)) (setq node2 (read))) ;;Opet zove funkciju da se zadaju parametri
;; )


;; ((and (eq (car node1) (car (car (car (car graf))))) (eq (car (cdr node1)) (car (car (cdr (car (car graf))))))) ;;Ako pronadjemo cvor
;; (print "Nasli smo cvor") ;;Kad pronadjemo prvi cvor da postoji

;; (cond 
;; (
;; (null (member currentPlayer (car (cdr (car (cdr (car (car graf)))))))) ;;Ovde se proverava da li nas cvor iz koga krecemo ima figuru (Ovo je za NE)
;; (print "Izabrano polje nema vasu figuru za pomeriti, pokusajte drugim poljem.")
;; (checkNode (setq graf graph) (setq node1 (read)) (setq node2 (read)))
;; )
;; (t (checkNeighbour (car (cdr (car graf))) node1 node2)) ;;Proveravamo da li uopste je drugo polje komsija prvog polja
;; )
;; )

;; (t (checkNode (cdr graf) node1 node2))
;; )
;; )

;; (defun checkNeighbour (graf node1 node2) ;;Proverava da li je drugo uneto polje sused prvog unetog polja
;; (cond
;; ((null graf)
;; (print "Cvorovi nisu susedi. Pokusajte ponovo.")
;; (checkNode graph (setq node1 (read)) (setq node2 (read)))
;; )
;; ((and (eq (car node2) (caaaar graf)) (eq (car (cdr node2)) (car (cadaar graf)))) ;;Postoji node2 kao potomak
;; ;;(print (nth 8 (car (cdr (car (cdr (car (car graf)))))))) ;;(- - - - - - - - X)
;; (cond
;; ((eq (nth 8 (car (cdr (car (cdr (car (car graf))))))) '-) ;;Da li je stack prazan
;; (prepareNode graph node1 node2)
;; )
;; (t (print "Nije prazan stack"))
;; )
;; )
;; (t (checkNeighbour (cdr graf) node1 node2))

;; )

;; )

;; (defun prepareNode (graf node1 node2)
;; (cond
;; ((and (eq (car node1) (car (car (car (car graf))))) (eq (car (cdr node1)) (car (car (cdr (car (car graf))))))) ;;Ovde nalazimo i saljemo decu cvora da nadjemo najkraci put
;; (findShortestPath graph (car (cdr (car graf))) node2)
;; )
;; (t (prepareNode (cdr graf) node1 node2))
;; )
;; )

;; (defun canIMoveIt (stack node2)
;; (cond
;; ((null stack) (print "Nikom nista"))
;; ((equal (caar stack) node2) (canIMoveIt2 helpStack (car stack))
;; )
;; (t (canIMoveIt (cdr stack) node2))
;; ))

;; (defun canIMoveIt2 (stack node2 &optional (node3 '()))
;; (cond
;; ((and (null stack) (not (eq node3 nil))) (print "Morate ponovo odigrati potez") (checkNode graph (setq node1 (read)) (setq node2 (read))))
;; ((null stack) (print "IDEMOO")) ;;pomeraj ovde radimo
;; ((<= (cadr node2) (cadr (car stack)))  (canIMoveIt2 (cdr stack) node2 node3))
;; (t (setq node3 (car stack)) (canIMoveIt2 (cdr stack) node2 node3))
;; )
;; )

;; (defun findShortestPath (graf children node2) ;;graf ceo, deca koja treba da se obidju i cvor na koji zelimo da se pomerimo
;; (cond
;; ((null children) (canIMoveIt helpStack node2))
;; (t (findPath graph (caar children) node2)
;;    (findShortestPath graph (cdr children) node2)
;; )
;; )
;; )

;; (defun findPath (graf child node2) ;;Uvek mi treba ceo graf kad zovem  
;; (depth-first3 graph (list (list child '0)) '() child)
;; )

;; (defun depth-first3(graph traversed visited child)
;;   (cond
;; ;;   ((not (eq (nth 8 (cadadr child)) '-)) (print "Morate odigrati na stack koji sadrzi figure") (checkNode graph (setq node1 (read)) (setq node2 (read))))
;;    ((null traversed) NIL) ;;Ako dodjemo da nema vise cvorova za obilazenje onda vraca nil (gleda cvor)
;;    (:else (let*
;;               ((new-visited (append visited (list (car traversed)))) ;;U promenljivu new-visited appenduje sve posecene (za sada je to '() i listu)
;;                (children (add-children3 graph (car traversed)        ;;prvog koji treba da se obilazi (A 0) npr...
;;                                         (append (cdr traversed) new-visited) child)) ;;U promenljivu children se smesta rezultat fje add-children3
;;                (new-traversed (append (cdr traversed) children))               ;;gde saljemo graf, prvi koji treba da se obidje (A 0) i sve posecene cvorove (dodajemo na ostatak traversed new-visited)
;;                ;;(traversal (depth-first3 graph new-traversed new-visited))) ;;u new-traversed se smesta ostatak koji treba da se obidju i deca
;;             ;;(cons (car traversed) traversal))) ;;I onda vezujemo za (A 0) traversal (on je opet depth-first3 samo sa novim koji treba da se obidju i to)
;;    )))))

;; ;;; Returns unvisited nodes from the children of a node
;; (defun add-children3(graf node visited child)
;;   (cond
;;    ((null graf) NIL)
;;    ((equal (caar graf) (car node)) (new-nodes3 (cadar graf) visited
;;                                                 (1+ (cadr node)) child))
                                                
;;    (:else (add-children3 (cdr graf) node visited child))
;;    ))
  

;;   (defun new-nodes3(children visited depth child)
;; ;;   (print (cadr (cadaar children)))
;; ;; ;;   (print (car children))
;; ;;   (print visited)
;;   (cond
;;    ((null children) NIL)
;;    ((not (eq (nth 8 (cadr (cadaar children))) '-)) 
;;    (cond 
;;    ((not (eq (nth 8 (cadadr child)) '-)) (setq helpStack (append helpStack (list (list (list (caar child) (caadr child)) (- depth 1)))))
;;    )
;;    (t (setq helpStack (append helpStack (list (list (list (caar child) (caadr child)) depth)))))
;;    )) ;;Ako ima stack
;;    ((assocmember3 (car children) visited) (new-nodes3 (cdr children) visited depth))
;;    (:else (cons (list (caar children) depth) ;;Ovde je udarena ispravka
;;                 (new-nodes3 (cdr children) visited depth child)))
;;    )
;;   )
  

;;   (defun assocmember3(key als)
;;   (cond
;;    ((null als) NIL)
;;    ((equal key (caar als)) T)
;;    (:else (assocmember3 key (cdr als)))
;;    )
;;   )



;; ;;(cons (caar child) (caadr child)) dotted

 
;; ;;   (print proba)
;;    ;; (print (depth-first3 graph '(((C 3) (1 (- - - - - - - - X)))) '()))
;;   (checkNode graph (setq node1 (read)) (setq node2 (read)))
;;  (print helpStack)
;; ;; ;;(setq node1 '(A 1))
;; ;; (print (car node1));;Izvlaci slovo (A 1) => A
;; ;; (print (car (cdr node1)));;Bas cifra da se izvuce (A 1) => 1
;; ;; ;;(print(car graph)) ;;Vraca od 
;; ;; (print (car graph))
;; ;; (print (car (car (car (car graph))))) ;;Izvukli smo od cvora iz grafa (A 1) => A
;; ;; (print (car (car (cdr (car (car graph)))))) ;;Izvukli smo iz cvora (1(-------)) => 1

;; ;;Da li sadrzi figuru igraca
;; ;; (print (member currentPlayer ))
;; ;;(print (car (cdr (car (cdr (car (car graph)))))))

;; (defun split (list count)
;;            (values (subseq list 0 count) (nthcdr count list)))
;;            (print (split '(- - - - X X O X O) 6)) ;;length za duzinu liste
;;            (setq L '(- - - - X X X X X))

;;            (defun my-count (a L)
;;   (cond
;;    ((null L) 0)
;;    ((equal a (car L)) (+ 1 (my-count a (cdr L))))
;;    (t (my-count a (cdr L)))))

;; (print (my-count '- L))

;; (defun remove-it (it list)
;;   (if (null list) 0
;;       (if (equal it (car list))
;;           (delete (car list))
;;           (remove-it (cdr list)))))

;;           (print (remove-it '- L))