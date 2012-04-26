(defpackage :html
  (:use :cl :cl-who :hunchentoot :parenscript :sql-util))

(in-package :html)

;;(sql-util:outpatient-select-all)

(defmacro with-html (&body body)
  `(with-html-output-to-string
     (*standard-output* nil :prologue t),@body))

(define-easy-handler (patients :uri "/patients" :default-request-type :post )
                                 ((uid :parameter-type 'integer)
                                    fname lname addr city state
                                    (zip :parameter-type 'integer)
                                    (dob :parameter-type 'integer)
                                    (phone :parameter-type 'integer)
                                    email 
                                    (emercon :parameter-type 'integer)
                                    insurinfo
                                    (insurcon :parameter-type 'integer)
                                    diag 
                                    (painlvl :parameter-type 'integer))
                     (with-html
                       (:html
                         (:head (:title "Patient Database Interaction"))
                         (:body
                           (:p (:form :method :post
                                      (:table :border 1 :cellpadding 2 :cellspacing 0
                                              (:tr
                                                (:td "UID:")
                                                (:td (:input :type :text
                                                             :name "uid" :value)))
                                              (:tr
                                                (:td "First Name:")
                                                (:td (:input :type :text
                                                             :name "fname" :value)))
                                              (:tr
                                                (:td "Last Name:")
                                                (:td (:input :type :text
                                                             :name "lname" :value)))
                                              (:tr
                                                (:td "Address: ")
                                                (:td (:input :type :text
                                                             :name "addr" :value)))
                                              (:tr
                                                (:td "City: ")
                                                (:td (:input :type :text
                                                             :name "city" :value)))
                                              (:tr
                                                (:td "State: ")
                                                (:td (:input :type :text
                                                             :name "state" :value)))
                                              (:tr
                                                (:td "Zip: ")
                                                (:td (:input :type :text
                                                             :name "zip" :value)))
                                              (:tr
                                                (:td "Date of Birth: ")
                                                (:td (:input :type :text
                                                             :name "dob" :value)))
                                              (:tr
                                                (:td "Phone Number: ")
                                                (:td (:input :type :text
                                                             :name "phone" :value)))
                                              (:tr
                                                (:td "Email: ")
                                                (:td (:input :type :text
                                                             :name "email" :value)))
                                              (:tr
                                                (:td "Emergency Contact: ")
                                                (:td (:input :type :text
                                                             :name "emercon" :value)))
                                              (:tr
                                                (:td "Insurance Info: ")
                                                (:td (:input :type :text
                                                             :name "insurinfo" :value)))
                                              (:tr
                                                (:td "Insurance Contact: ")
                                                (:td (:input :type :text
                                                             :name "insurcon" :value)))
                                              (:tr
                                                (:td "Diagnosis: ")
                                                (:td (:input :type :text
                                                             :name "diag" :value)))
                                              (:tr
                                                (:td "Pain Level: ")
                                                (:td (:input :type :text
                                                             :name "painlvl" :value)))
                                              (:tr
                                                (:td :colspan 2
                                                     (:input :type "submit"))))))))))
