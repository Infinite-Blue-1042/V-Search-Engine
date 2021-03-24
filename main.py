List = {"abcd":1,"efgh":2,"ijkl":3,"mnop":4}
User = input("Search:")
for a in User:
    for b in List:
        for c in b:
            if c == a:
                print(b, List[b])