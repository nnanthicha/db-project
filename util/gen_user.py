import string
import random
import bcrypt


def gen_user():
    email = "".join(random.choice(string.ascii_lowercase)
                    for _ in range(5)) + "@example.com"

    password = "".join(random.choice(string.ascii_letters) for _ in range(10))
    password = bytes(password, "utf8")
    salt = bcrypt.gensalt()
    hashed = bcrypt.hashpw(password, salt)

    name = random.choice(string.ascii_uppercase) + "".join(
        random.choice(string.ascii_lowercase) for _ in range(9))
    t = random.choice(["Customer", "Delivery Person", "Restaurant"])
    phone = "0" + "".join([str(random.randint(0, 10)) for _ in range(8)])
    return email, hashed.decode("utf8"), salt.decode("utf8"), name, t, phone


for i in range(5):
    email, hashed, salt, name, t, phone = gen_user()
    print(f'INSERT INTO user_account (email, hashed_password, salt) VALUES ("{email}", "{hashed}", "{salt}");')
    print(f'INSERT INTO user (type, email, name, phone_number) VALUES ("{t}", "{email}", "{name}", "{phone}");')