## Functions that cache the inverse of a matrix
## Usage example:
## > source('cachematrix.R')
## > m <- makeCacheMatrix(matrix(c(2, 0, 0, 2), c(2, 2)))
## > cacheSolve(m)
## [,1] [,2]
## [1,]  0.5  0.0
## [2,]  0.0  0.5

  makeCacheMatrix <- function(x = matrix()) {
    
    ## Create a matrix  which is a list containing fcntions for
    ##set the value of the matrix
    ##get the value of the matrix
    ## set the value of the inverse matrix
    ## get the value of the inverse matrix
    i <- NULL
    set <- function(y) {
      x <<- y
      i <<- NULL
    }
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
  
 
  ## Calculate the inverse of matrix created with the above
  ## function, reusing cached result if it is available
  
cacheSolve <- function(x, ...) {
  
  i <- x$getinverse()
  if(!is.null(i)) {
    message("chcek cached data")
    return(i)
  }
  m <- x$get()
  i <- solve(m, ...)
  x$setinverse(i)
  i
}

