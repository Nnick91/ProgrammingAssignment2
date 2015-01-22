## The following functions displays use of how cache data can be useful and 
## prevent time in very time consuming process like calculating inverse of
## a matrix. The time spent in calculating inverse of a huge matrix can be 
## very large and thus the following solutions can come in handy then.

## It is a list containing functions to set the matrix, get the matrix, set
## inverse of the matrix and get inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  
  set <- function(y){
    x <<- y
    inv <- NULL
  }
  
  get <- function(){
    x
  }
  
  setinv <- function(inverse){
    inv <- inverse
  }
  
  getinv <- function(){
    inv
  }
  
  list(set = set,
       get = get,
       setinv = setinv,
       getinv = getinv)

}


## The following function returns the inverse of the matrix created with the 
## above function i.e. makeCacheMatrix. If the inverse of the matrix already
## exists, it returns the stored value otherwise it calculates the inverse
## and set the value in setinv function.

cacheSolve <- function(x, ...) {  
  inv <- x$getinv()
  
  if(!is.null(inv)){
    message("Getting cached inverse")
    return (inv)
  }
  
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  
  inv
}
