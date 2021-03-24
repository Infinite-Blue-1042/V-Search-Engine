List = {"1 + 1 = 3?":"Content","Dreamworks Kung Fu Panda":"Content","Page":"Content","Page1":"Content"}
User = input("Search:")
for a in User:
    for b in List:
        for c in b:
            if c == a:
                print(b, List[b])