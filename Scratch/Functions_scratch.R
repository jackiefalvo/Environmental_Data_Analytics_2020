# trying to write a function that iterates through each number in vector and 
# changes certain ones

vector1 <- c(0, 1, 2, 3, 4, 5)
vector1

do_this <- ifelse(vector1 > 3, "high", "low")

judgement <- function(x){
  do_this
}

judgement  
do_this
judgement(vector1)

change_evens <- function(x){
  if x %% 2 == 0{
    x*2
  }
  else{
    print('pass')
  }
}
  
## function tutorial
# create function that raises x to the power y

pow <- function(x, y) {
  # function will print x raise to power y
  result <- x^y #function will do the math and call the answer 'result'
  print(paste(x, 'raised to power', y, 'is', result)) #function will print
}

# don't need to assign x and y separately, although I could
# just threw in two numbers to function arguments x and y
pow(2, 4)
pow(4, 2)  

# can call named arguments or just use numbers like we did above

pow(vector1[5], 2)


  