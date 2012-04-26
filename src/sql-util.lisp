(defpackage :sql-util
  (:nicknames :sql-util)
  (:use :cl :sqlite)
  (:export :outpatient-insert
           :resident-insert
           :outpatient-select-all
           :resident-select-all))

(in-package :sql-util)

(defvar db (connect "mvch"))

(defun outpatient-insert (uid fname lname addr city state zip dob
                            phone email emercon insurinfo insurcon diag painlvl)
  "Insert statement for outpatient table"
    (execute-non-query db "insert into outpatient values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
                      uid fname lname addr city state zip dob phone email emercon insurinfo insurcon diag painlvl))

(defun resident-insert (uid fname lname addr city state zip dob
                        phone email emercon insurinfo insurcon
                        date-admit date-disch bed-id painlvl diag work-unit)
  "Insert statement for resident table"
    (execute-non-query db "insert into resident values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
                       uid fname lname addr city state zip dob phone email emercon insurinfo insurcon date-admit date-disch bed-id painlvl diag work-unit))

(defun outpatient-select-all ()
  "Selects all items from outpatient table and puts them into a list"
   (execute-to-list db "select * from outpatient"))

(defun resident-select-all ()
  "Selects all items from resident table and puts them into a list"
  (execute-to-list db "select * from resident"))
