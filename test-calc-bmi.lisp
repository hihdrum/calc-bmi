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

(deftest test-arguments-type-check ()
  (flet ((create-expected-value (target value type)
           (format nil
                   "The value of CALC-BMI::~A is ~A, which is not of type CALC-BMI::~A."
                   target value type))
         (wrong-arguments-test (height weight expected-value)
           (handler-case (calc-bmi height weight)
             (error (condition)
               (ok (string= (format nil "~A" condition) expected-value))))))
    (testing "Should be an error expect for integer type"
      (testing "When string is specified in the arg height"
        (wrong-arguments-test
         "160" 50
         (create-expected-value "HEIGHT" "\"160\"" "POSITIVE-INTEGER")))
      (testing "When string is specified in the arg weight"
        (wrong-arguments-test
         160 "50"
         (create-expected-value "WEIGHT" "\"50\"" "POSITIVE-INTEGER")))
      (testing "When negative integer is specified in the arg height"
        (wrong-arguments-test
         -1 50
         (create-expected-value "HEIGHT" "-1" "POSITIVE-INTEGER")))
      (testing "When negative integer is specified in the arg weight"
        (wrong-arguments-test
         160 -1
         (create-expected-value "WEIGHT" "-1" "POSITIVE-INTEGER"))))))
