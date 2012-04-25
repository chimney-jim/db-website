(asdf:defsystem :db-website
                :name "db-website"
                :description "My website for DB class"
                :version "0.5"
                :author "Jim Fitzgerald <dumples5@gmail.com>"
                :license "LLGPL"
                :pathname "src/"
                :components ((:file "html" :depends-on ("cl-who" "hunchentoot"
                                                        "parenscript" "sql-util"))
                             (:file "sql-util" :depends-on ("sqlite"))))                   
