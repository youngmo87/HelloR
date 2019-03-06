#0, 1, 1, 2, 3, 5, 8, 13, 21
val = c(0,1)
while(TRUE) {
  x = as.integer(readline(prompt = "Input the number: "))
  if (x < 0) break
  
  if (x == 1)
    print("The F_value of 1 is 0")
  
  else if (x == 2)
    print("The F_value of 1 is 1")
  
  else {
    for (x in 3:x)
    val[x] = sum(val[x-2] + val[x-1])
    print(paste("The F_value of", x, "th is", val[x]))
    } 
  print(val[1:x])
}


