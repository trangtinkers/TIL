(defstruct account
  (name "") (balance 0.00) (interest-rate .06))

(defun account-withdraw (account amt)
  "Make a withdrawal from this account."
  (if (<= amt (account-balance account))
      (decf (account-balance account) amt)
      'insufficient-funds))

(defun account-deposit (account amt)
  "Make a deposit to this account."
  (incf (account-balance account) amt))

(defun account-interest (account)
  "Accumulate interest in this account."
  (incf (account-balance account)
        (* (account-interest-rate account)
           (account-balance account))))

(defvar acct1 (make-account :name "Trang La" :balance 10000 :interest-rate .06))

(account-withdraw acct1 100)