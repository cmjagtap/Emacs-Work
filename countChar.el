(defun countChar (start end)
  (interactive "r")
  (message "Counting char …")
  (save-excursion
    (let (charCounter)
      (setq charCounter (- end start))
      (message "Chars: %d." charCounter)
      )))


(defun countWords (start end)
  (interactive "r")
  (message "Counting words…")
  (save-excursion
    (let (wordCount )
      (setq wordCount 0)
      (goto-char start)
      (while (and (< (point) end)
                  (re-search-forward "\\w+\\W*" end t))
        (setq wordCount (1+ wordCount)))

      (message "Words: %d." wordCount)
      )))
