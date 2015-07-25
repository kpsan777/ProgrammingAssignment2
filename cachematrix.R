## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#Functions that cache the inverse of a matrix
+##
  +## Usage example:
  +##
  +## > source('cachematrix.R')
  +## > m <- makeCacheMatrix(matrix(c(2, 0, 0, 2), c(2, 2)))
  +## > cacheSolve(m)
  +## [,1] [,2]
  +## [1,]  0.5  0.0
  +## [2,]  0.0  0.5

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL  }
get <- function() x
setinverse <- function(inv) i <<- inv
getinverse <- function() i
  list(
    set = set,
    get = get,
    setinverse = setinverse,
    getinverse = getinverse
   )
}



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  i <- x$getinverse()
   if(!is.null(i)) {
     message("getting cached data")
     return(i)
     }
  m <- x$get()
  i <- solve(m, ...)
  x$setinverse(i)
  i
  } 



