(defun assocmember3(key als)
  (cond
   ((null als) NIL)
   ((equal key (caar als)) T)
   (:else (assocmember3 key (cdr als)))
   )
  )

;;; Returns unvisited nodes from the children of a node
(defun add-children3(graph node visited)
  (cond
   ((null graph) NIL)
   ((equal (caar graph) (car node)) (new-nodes3 (cadar graph) visited
                                                (1+ (cadr node))))
   (:else (add-children3 (cdr graph) node visited))
   )
  )

;;; Returns new, unvisited nodes from the children of a node
(defun new-nodes3(children visited depth)
  (cond
   ((null children) NIL)
   ((assocmember3 (car children) visited) (new-nodes3 (cdr children) visited depth))
   (:else (cons (list (car children) depth) 
                (new-nodes3 (cdr children) visited depth)))
   )
  )

(defun depth-first3(graph traversed visited)
  (cond
   ((null traversed) NIL) ;;Ako dodjemo da nema vise cvorova za obilazenje onda vraca nil (gleda cvor)
   (:else (let*
              ((new-visited (append visited (list (car traversed)))) ;;U promenljivu new-visited appenduje sve posecene (za sada je to '() i listu)
               (children (add-children3 graph (car traversed)        ;;prvog koji treba da se obilazi (A 0) npr...
                                        (append (cdr traversed) new-visited))) ;;U promenljivu children se smesta rezultat fje add-children3
               (new-traversed (append (cdr traversed) children))               ;;gde saljemo graf, prvi koji treba da se obidje (A 0) i sve posecene cvorove (dodajemo na ostatak traversed new-visited)
               (traversal (depth-first3 graph new-traversed new-visited))) ;;u new-traversed se smesta ostatak koji treba da se obidju i deca
            (cons (car traversed) traversal))) ;;I onda vezujemo za (A 0) traversal (on je opet depth-first3 samo sa novim koji treba da se obidju i to)
   ))
  

(defun node-levels(graph node)
  (depth-first3 graph (list (list node '0)) '()) ;;U Na pocetku se salje graf i  kaze od pocetnog cvora da je nivo 0
  )                                              ;;i salje praznu listu za obidjene cvorove


(setq graf1 '((a (c b)) (b (c e)) (c (a b))
(d (e f)) (e (d)) (f (a))))
   (trace add-children3)
   (trace new-nodes3)
   (trace node-levels)
   (trace depth-first3)
   (trace assocmember3)
  (print (node-levels graf1 'b))
