## The functions cache the inverse of given matrix 


## The first function creates a list of 4 functions that 
#1. set the value of the matrix
#2. get the value of the matrix
#3. set the value of the investe matrix
#4. get the value of the inverse matrix

makeCacheMatrix <- function(mymatrix = matrix()) {
  #create a variable for the inverse matrix & set it to NULL
  inversemat<-NULL
  
  #creates the set function that defines the matrix and sets the inverse matrix to NULL
  set<-function(y=matrix()){
    mymatrix<<-y
    inversemat<<-NULL
  }
  #creates the get function that outputs the inital matriy
  get<-function() mymatrix

  #creates the setinverse function that solves for the inverse matrix and strores the result in inversmat variable
  setinverse<-function(solve) inversemat<<-solve(mymatrix)
  
  #creates the getinverse function that outputs the inverse matrix
  getinverse<-function() inversemat
  
  #compiles a liste of the 4 functions
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}



## The Second functions calls the first to calculate inverse matrix

cacheSolve <- function(x,...) {
  ## Calls getinverse in the list of functions of makeCachematrix to obtanin the inversematrix
    inversemat <-x$getinverse()
  #If the variable is not empty, return the value it contains
  if(!is.null(inversemat)){
            message("getting cached data")
            return (inversemat) }
  #if the inverse matrux variable is empty
  #obtain the original matrix
  data <-x$get()
  #solve for the inversematrix
  inversemat<-solve(data,...)
  #set the result as the value of the inversematrix varibale
  x$setinverse(inversemat)
  #print the inversematrix variable
  inversemat
  }
