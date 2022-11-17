import bcrypt
password = b"tests"
salt = bcrypt.gensalt()
hashed = bcrypt.hashpw(password, salt)
print(hashed)
print(salt)