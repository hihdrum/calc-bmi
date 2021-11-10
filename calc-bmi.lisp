(defpackage #:calc-bmi
  (:use #:cl)
  (:export #:calc-bmi))

(in-package #:calc-bmi)

(deftype positive-integer ()
  '(integer 0 *))

(defun to-string-result (value)
  (format nil "~,2f" value))

(defun to-meter (value)
  (/ value 100))

(defun calc-bmi (height weight)
  (check-type height positive-integer)
  (check-type weight positive-integer)
  (to-string-result
   (/ (float weight)
      (expt (float (to-meter height)) 2))))
