(ql:quickload '(cl-who hunchentoot parenscript))

(defpackage :html
  (:use :cl :cl-who :hunchentoot :parenscript))

(in-package :html)

(defmacro with-html (&body body)
  `(with-html-output-to-string
     (*standard-output* nil :prologue t),@body))

(define-easy-handler (say-yo :uri "/yo") (name)
                     (setf (content-type*) "text/plain")
                     (format nil "Hey~@[ ~A~]!" name))

;(define-easy-handler (patients :uri "/patients") ((uid :parameter-type 'integer)
;                                                  fname lname addr city state
;                                                  (zip :parameter-type 'integer)
;                                                  (dob :parameter-type 'integer)
;                                                  (phone :parameter-type 'integer)
;                                                  email 
;                                                  (emrcon :parameter-type 'integer)
;                                                  insurinfo
;                                                  (insurcon :parameter-type 'integer)
;                                                  diag 
;                                                  (painlvl :parameter-type 'integer))
;                     (with-html
;                       (:html
;                         (:head (:title "Patient Database Interaction"))
;                         (:body
;                           (:h1 "Hello World!!")))))


;(defun main-page ()
;    (with-html
;      (:html
;        (:head (:title "Hello World"))
;        (:body
;          (:p (:form :method
