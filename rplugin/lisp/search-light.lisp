(defpackage #:search-light
  (:use #:cl))
(in-package #:search-light)
(nvim:defcommand/s search-light (&rest args &opts (range r) bang)
  (setf *buf-nr* (nvim:call-function "bufnr" ()))
  (nvim:call-function "nvim_open_win" (*buf-nr* false ()))
  (setf *current-dir* (nvim:call-function "getcwd" ()))
  ;(setf *files* (uiop:directory-files "**/**"))
  ;(setf (nvim:current-line) (format nil "~{~A~^,~}" *buf-nr*))
  (setf (nvim:current-line) (format nil "~A" *buf-nr*)))

