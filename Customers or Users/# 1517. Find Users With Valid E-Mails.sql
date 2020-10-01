# 1517. Find Users With Valid E-Mails

# This table contains information of the users signed up in a website. Some e-mails are invalid

# A valid e-mail has a prefix name and a domain where: 
# The prefix name is a string that may contain letters (upper or lower case), digits, underscore '_', period '.' and/or dash '-'. The prefix name must start with a letter.
# The domain is '@leetcode.com'.

SELECT *
FROM Users
WHERE REGEXP_LIKE(mail, '^[a-zA-Z][a-zA-Z0-9\_\.\-]*@leetcode.com')

# ^ means the beginning of the string
# [] means character set. [A-Z] means any upper case chars
# - means range
# notation: + or *
#    + means at least one of the character from the preceding charset, and * means 0 or more
# \ inside the charset mean skipping. \. means we want the dot as 
#    for example: if we would like to find - itself as a character? use \-. 
# @ refers to exact match
