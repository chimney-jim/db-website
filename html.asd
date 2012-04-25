(asdf:defsystem :db-website
                :name "db-website"
                :description "My website for DB class"
                :version "0.5"
                :author "Jim Fitzgerald <dumples5@gmail.com>"
                :license "LLGPL"
                :pathname "src/"
                :components ((:file "html")
                             (:file "sql-util")))
