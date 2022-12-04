f = open("dumped_for_complex_queries.sql")
for i in f:
    if "INSERT" in i:
        print(i)
