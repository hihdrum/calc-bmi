(defpackage #:test-calc-bmi
  (:use #:cl
        #:rove
        #:calc-bmi))

(in-package #:test-calc-bmi)

(deftest test-calc-bmi ()
  (testing "Height: 160, Weight 50, Result: 19.53"
           (ok (string= (calc-bmi 160 50) "19.53")))
  (testing "Height: 165, Weight 58, Result: 21.30"
           (ok (string= (calc-bmi 165 58) "21.30")))
  (testing "Height: 170, Weight 60, Result: 20.76"
           (ok (string= (calc-bmi 170 60) "20.76"))))
